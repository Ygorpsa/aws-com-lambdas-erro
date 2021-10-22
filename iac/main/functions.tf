locals {
  functions = {
    document_create = {
      method_path = "GET /document"
      source_path = "${var.function_root}/document"
      handler     = "list.handler"
      environment_variables = {
        "DB_HOST" = module.db_default.db_instance_address 
        "DB_PASSWORD" = module.db_default.db_instance_password
        "DB_USERNAME" = var.db_username
        "DB_DBNAME" = var.db_dbname
      }
    }
    document_list = {
      method_path = "POST /document"
      source_path = "${var.function_root}/document"
      handler     = "create.handler"
      environment_variables = {
        "DB_HOST" = module.db_default.db_instance_address 
        "DB_PASSWORD" = module.db_default.db_instance_password
        "DB_USERNAME" = var.db_username
        "DB_DBNAME" = var.db_dbname
      }
    }
  }
}