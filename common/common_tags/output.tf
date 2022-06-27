output "commontags" {
    value = merge({
        name = var.name
        stack = var.stack
        Enviroment = var.enviroment
    },
	var.additional_tags,
	)

}
