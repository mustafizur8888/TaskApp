<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TaskApp.Default" %>


<!DOCTYPE html>

<html>
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title></title>
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
</head>
<body>

    <div class="container">
        <form id="form1" runat="server">
            <div class="row">
                <div class="alert  alert-danger text-center" runat="server" id="divError">
                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                    <asp:Label runat="server" ID="lblError"></asp:Label>
                </div>
                <div class="alert  alert-success text-center" runat="server" id="divSucc">
                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                    <asp:Label runat="server" ID="lblSuccess"></asp:Label>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 col-lg-12 col-sm-12">
                    <div class="form-group">
                        <label for="txtTaskId">Task Name</label>
                        <asp:TextBox runat="server" ID="txtTaskId" ReadOnly="True" CssClass="form-control"></asp:TextBox>

                    </div>
                </div>

                <div class="col-md-12 col-lg-12 col-sm-12">
                    <div class="form-group">
                        <label for="txtTaskName">Task Name</label>
                        <asp:TextBox runat="server" ID="txtTaskName" CssClass="form-control"></asp:TextBox>

                    </div>
                </div>



                <div class="col-md-12 col-lg-12 col-sm-12">
                    <div class="form-group">
                        <label for="txtDescription">Task Description</label>
                        <asp:TextBox runat="server" ID="txtDescription" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-12 col-sm-12 col-lg-12" style="padding-left: 2%">
                    <div class="form-group ">
                        <div class="btn-group">
                            <asp:Button runat="server" ID="btnCancel" CssClass="btn btn-primary" Text="Cancel" OnClick="btnCancel_OnClick"/>
                            <asp:Button runat="server" ID="btnSave" CssClass="btn btn-primary" Text="Save" OnClick="btnSave_OnClick" />

                        </div>
                    </div>
                </div>

                <div class="col-md-12 col-lg-12 col-sm-12">
                    <asp:GridView ID="grdTask" runat="server" CssClass="table table-striped table-hover  table-condensed " AutoGenerateColumns="False" GridLines="None">
                        <Columns>
                            <asp:TemplateField HeaderText="id">
                                <ItemTemplate>

                                    <asp:Label runat="server" ID="lblid" Text='<%# Bind("id") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Name">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lblname" Text='<%# Bind("name") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Description">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lbldescription" Text='<%# Bind("description") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="DateCreated">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lbldateCreated" Text='<%# Bind("dateCreated") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="DateUpdated">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lbldateUpdated" Text='<%# Bind("dateUpdated") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Action">
                                <ItemTemplate>
                                    <div class="btn-group btn-group-sm">
                                        <asp:Button runat="server" CssClass="btn btn-primary btn-sm " Text="Edit" ID="btnEdit" OnClick="btnEdit_OnClick" />
                                        <asp:Button runat="server" CssClass="btn btn-danger  btn-sm" Text="Delete" ID="btnDelete" OnClick="btnDelete_OnClick" />
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </form>
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</body>
</html>
