using WorkflowService as WorkflowService from '../../srv/workflow-service';

annotate WorkflowService.Header with @odata.draft.enabled;

annotate WorkflowService.Header with @UI : {
    LineItem                      : [
        {
            ![@UI.Hidden],
            Value : ID
        },
        {
            Label : '{i18n>Header}',
            $Type : 'UI.DataField',
            Value : name,
        },
        {
            Label : '{i18n>Status}',
            $Type : 'UI.DataField',
            Value : status,
        },
        {
            Label : '{i18n>Resolution}',
            $Type : 'UI.DataField',
            Value : resolution,
        }
    ],
    Identification                : [{
        $Type  : 'UI.DataFieldForAction',
        Action : 'WorkflowService.startWorkflow',
        Label  : 'Start Workflow',

    }],
    Facets                        : [
        {
            Label  : '{i18n>General Info}',
            $Type  : 'UI.ReferenceFacet',
            Target : ![@UI.FieldGroup#HeaderGeneralInfo]
        },
        {
            Label  : '{i18n>Items}',
            $Type  : 'UI.ReferenceFacet',
            Target : 'items/@UI.LineItem'
        }
    ],
    FieldGroup #HeaderGeneralInfo : {
        $Type : 'UI.FieldGroupType',
        Data  : [
            {
                Label : '{i18n>Name}',
                $Type : 'UI.DataField',
                Value : name,
            },
            {
                Label : '{i18n>Resolution}',
                $Type : 'UI.DataField',
                Value : resolution,
            },
            {
                Label : '{i18n>Status}',
                $Type : 'UI.DataField',
                Value : status,
            }
        ]
    }
};

annotate WorkflowService.Item with @UI : {
    LineItem                    : [
        {
            ![@UI.Hidden],
            Value : ID
        },
        {
            Label : '{i18n>Item Name}',
            $Type : 'UI.DataField',
            Value : name,
        }
    ],
    Facets                      : [{
        Label  : '{i18n>Item General Info}',
        $Type  : 'UI.ReferenceFacet',
        Target : ![@UI.FieldGroup#ItemGeneralInfo]
    }],
    FieldGroup #ItemGeneralInfo : {
        $Type : 'UI.FieldGroupType',
        Data  : [{
            Label : '{i18n>Item Name}',
            $Type : 'UI.DataField',
            Value : name,
        }]
    }
};
