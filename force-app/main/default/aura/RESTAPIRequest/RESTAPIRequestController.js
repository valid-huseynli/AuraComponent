({
    doInit: function(component, event, helper) {
      var action = component.get("c.getExternalData");
      action.setCallback(this, $A.getCallback(function(response) {
        var state = response.getState();
        if (state === "SUCCESS") {
          component.set("v.records", response.getReturnValue());
        }else {
            console.error(response.getError());
        }
      }));
      $A.enqueueAction(action);
    },
    saveChanges: function(component, event, helper) {
        var records = component.get("v.records");
        var action = component.get("c.updateRecords");
        action.setParams({ records: records });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var updatedRecords = response.getReturnValue();
                component.set("v.records", updatedRecords);
                alert("Changes saved successfully");
            } else {
                alert("An error occurred while saving changes");
            }
        });
        $A.enqueueAction(action);
    }
  })