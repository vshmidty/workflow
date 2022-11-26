using {com.leverx.workflow as db} from '../db/data-model';

service WorkflowService @(
                          // no authorization for now -> adjust in frame of POC
                          // requires : 'authenticated-user',

                        impl : './libs/workflow-service.js') {
    // some kind of data archiving after completion
    action clearAll();

    entity Header     as projection on db.Header {
        *,
        @readonly ID,
        @readonly status,
        @readonly resolution,
    } actions {
        // complete action -> plan to call it before workflow is complete to finish
        action complete(resolution : String) returns Header;
        // action to start workflow
        @(
            Common.SideEffects              : {TargetEntities : [_it, ]},
            cds.odata.bindingparameter.name : '_it',
            Core.OperationAvailable         : _it.startWorkflowEnabled
        )
        action startWorkflow()               returns Header;
    }

    // the child can be created as deep insert for now
    //@readonly
    entity Item       as projection on db.Item;
    // for future dev!
    // @readonly
    entity Attachment as projection on db.Attachment;

}
