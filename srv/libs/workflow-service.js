const cds = require("@sap/cds");
const WorkflowStarter = require("./workflow-starter");

class WorkflowService extends cds.ApplicationService {
  async init() {
    const { Header } = cds.entities("com.leverx.workflow.Header");
    const { Attachment } = cds.entities("com.leverx.workflow.Attachment");

    // register your event handlers...
    this.before("CREATE", Header, (req) => {
      const header = req.data;
      header.status = "In Progress";
    });

    this.after("READ", Header, (each) => {
      //for new inquires only
      console.log(each.status);
      if (each.status != null && each.status === "In Progress") {
        each.startWorkflowEnabled = true;
      } else {
        each.startWorkflowEnabled = false;
      }
      console.log(each.startWorkflowEnabled);
    });

    // handle complete
    this.on("complete", Header, async (each) => {
      const headers = await cds.run(each.query);
      if (headers.length != 1) {
        return each.error(404, "Request not found");
      }
      const header = headers[0];
      const { resolution } = each.data;
      let query = UPDATE("Header", header.ID).with({
        status: "Completed",
        resolution: resolution,
      });
      await cds.run(query);
      let result = cds.run(each.query);
      each.reply(result);
    });
    // start workflow action
    this.on("startWorkflow", Header, async (each) => {
      const headers = await cds.run(each.query);
      if (headers.length != 1) {
        return each.error(404, "Request not found");
      }
      const header = headers[0];
      if (header.status !== "In Progress") {
        return each.error(
          400,
          "Request can not be processed in status " + header.status
        );
      }
      let workflowStarter = new WorkflowStarter(
        "workflow-starter-service",
        "namespace.myworkflow",
        { ID: header.ID }
      );
      workflowStarter.triggerStartEvent();
      let query = UPDATE("Header", header.ID).with({
        status: "In Approval",
      });
      await cds.run(query);
      let result = cds.run(each.query);
      each.reply(result);
    });
    // ensure to call super.init()
    await super.init();
  }
}
module.exports = WorkflowService;
