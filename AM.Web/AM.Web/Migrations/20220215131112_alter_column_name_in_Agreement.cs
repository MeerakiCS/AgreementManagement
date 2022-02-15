using Microsoft.EntityFrameworkCore.Migrations;

namespace AM.Web.Migrations
{
    public partial class alter_column_name_in_Agreement : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "id",
                table: "Agreements",
                newName: "Id");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "Id",
                table: "Agreements",
                newName: "id");
        }
    }
}
