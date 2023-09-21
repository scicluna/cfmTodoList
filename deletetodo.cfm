<cfscript>
    if (structKeyExists(form, "todoId")){
        queryExecute(
            "DELETE FROM todos WHERE id = :todoId",
            {todoId: form.todoId},
            {datasource: "mysql"}
        );
    }
</cfscript>

<cflocation url="todolist.cfm" addtoken="no">