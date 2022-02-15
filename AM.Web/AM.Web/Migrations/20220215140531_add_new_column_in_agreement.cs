using Microsoft.EntityFrameworkCore.Migrations;

namespace AM.Web.Migrations
{
    public partial class add_new_column_in_agreement : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<bool>(
                name: "Active",
                table: "Agreements",
                type: "bit",
                nullable: false,
                defaultValue: false);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Active",
                table: "Agreements");
        }
    }
}
