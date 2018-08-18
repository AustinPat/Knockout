<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Demo1.aspx.cs" Inherits="Demo1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>My first knockout page</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <p>First Name : <span data-bind="text: firstname" /></p>
            <p>Last Name : <span data-bind="text: lastname"/></p>
        </div>
        <hr />
        <div>
            <p>First Name : <asp:TextBox ID="txtUser" runat="server" data-bind="value : firstname, valueUpdate : 'keyup' " /></p>
            <p>FirstName : <asp:TextBox ID="txtPassword" runat="server" data-bind="value : lastname" /></p>
        </div>
        <hr />
        <p>Full Name : <span data-bind="text: fullname" /></p>

    </form>
    <script src="Scripts/knockout-3.4.2.js"></script>
    <script src="Scripts/jquery-3.3.1.js"></script>
    <script type="text/javascript">
        var vm = {
            //firstname: "Austin",
            //lastname: "Patterson"
            firstname: ko.observable("Austin"),
            lastname: ko.observable("Patterson")

        };

        vm.fullname = ko.dependentObservable(function () {
            return vm.firstname() + " " + vm.lastname()
        });

        vm.firstname.subscribe(function (val) {
            console.log("First Name Updated as " + val);

        });

        ko.applyBindings(vm);
    </script>


</body>
</html>
