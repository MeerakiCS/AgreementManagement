using Microsoft.EntityFrameworkCore.Migrations;

namespace AM.Web.Migrations
{
    public partial class alter_column_name_in_ProductGroups : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Agreements_ProductGroups_ProductGroupid",
                table: "Agreements");

            migrationBuilder.DropForeignKey(
                name: "FK_Products_ProductGroups_ProductGroupid",
                table: "Products");

            migrationBuilder.RenameColumn(
                name: "ProductGroupid",
                table: "Products",
                newName: "ProductGroupId");

            migrationBuilder.RenameIndex(
                name: "IX_Products_ProductGroupid",
                table: "Products",
                newName: "IX_Products_ProductGroupId");

            migrationBuilder.RenameColumn(
                name: "id",
                table: "ProductGroups",
                newName: "Id");

            migrationBuilder.RenameColumn(
                name: "ProductGroupid",
                table: "Agreements",
                newName: "ProductGroupId");

            migrationBuilder.RenameIndex(
                name: "IX_Agreements_ProductGroupid",
                table: "Agreements",
                newName: "IX_Agreements_ProductGroupId");

            migrationBuilder.AddForeignKey(
                name: "FK_Agreements_ProductGroups_ProductGroupId",
                table: "Agreements",
                column: "ProductGroupId",
                principalTable: "ProductGroups",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_Products_ProductGroups_ProductGroupId",
                table: "Products",
                column: "ProductGroupId",
                principalTable: "ProductGroups",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Agreements_ProductGroups_ProductGroupId",
                table: "Agreements");

            migrationBuilder.DropForeignKey(
                name: "FK_Products_ProductGroups_ProductGroupId",
                table: "Products");

            migrationBuilder.RenameColumn(
                name: "ProductGroupId",
                table: "Products",
                newName: "ProductGroupid");

            migrationBuilder.RenameIndex(
                name: "IX_Products_ProductGroupId",
                table: "Products",
                newName: "IX_Products_ProductGroupid");

            migrationBuilder.RenameColumn(
                name: "Id",
                table: "ProductGroups",
                newName: "id");

            migrationBuilder.RenameColumn(
                name: "ProductGroupId",
                table: "Agreements",
                newName: "ProductGroupid");

            migrationBuilder.RenameIndex(
                name: "IX_Agreements_ProductGroupId",
                table: "Agreements",
                newName: "IX_Agreements_ProductGroupid");

            migrationBuilder.AddForeignKey(
                name: "FK_Agreements_ProductGroups_ProductGroupid",
                table: "Agreements",
                column: "ProductGroupid",
                principalTable: "ProductGroups",
                principalColumn: "id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_Products_ProductGroups_ProductGroupid",
                table: "Products",
                column: "ProductGroupid",
                principalTable: "ProductGroups",
                principalColumn: "id",
                onDelete: ReferentialAction.Restrict);
        }
    }
}
