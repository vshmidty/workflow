const request = require("sync-request");

class WorkflowStarter {
  constructor(workflowService, definitionId, context) {
    let vcapServices = JSON.parse(process.env.VCAP_SERVICES);
    // obtain WF service by provided key
    let workflowServices = vcapServices.workflow;
    let intendedWorkflowService = workflowServices.find(
      (workflowServiceToCheck) =>
        workflowServiceToCheck.name === workflowService
    );
    if (
      intendedWorkflowService === undefined ||
      intendedWorkflowService === null
    ) {
      throw new Error("Workflow service not found");
    }
    this.workflowService = intendedWorkflowService.credentials;
    this.definitionId = definitionId;
    this.context = context;
  }

  fetchToken() {
    let authorization =
      "Basic " +
      Buffer.from(
        this.workflowService.uaa.clientid +
          ":" +
          this.workflowService.uaa.clientsecret
      ).toString("base64");
    let tokenRequest = request(
      "POST",
      this.workflowService.uaa.url +
        "/oauth/token?grant_type=client_credentials",
      {
        headers: { Authorization: authorization },
      }
    );
    if (tokenRequest.statusCode !== 200) {
      throw new Error("Token can not be fetched: " + tokenRequest.getBody());
    }
    let response = JSON.parse(tokenRequest.getBody());
    return response.access_token;
  }

  sendStartEvent(token) {
    let workflowStartRequest = request(
      "POST",
      this.workflowService.endpoints.workflow_rest_url +
        "/v1/workflow-instances",
      {
        headers: {
          "Content-Type": "application/json",
          Authorization: "Bearer " + token,
        },
        body: JSON.stringify({
          definitionId: this.definitionId,
          context: this.context,
        }),
      }
    );
    if (workflowStartRequest.statusCode !== 201) {
      throw new Error(
        "Error on workflow start: " + workflowStartRequest.getBody()
      );
    }
    return JSON.parse(workflowStartRequest.getBody());
  }

  triggerStartEvent() {
    let accessToken = this.fetchToken();
    return this.sendStartEvent(accessToken);
  }
}

module.exports = WorkflowStarter;
