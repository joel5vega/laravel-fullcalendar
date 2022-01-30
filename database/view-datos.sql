CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `datos` AS
    SELECT 
        `clases`.`id` AS `groupId`,
        `clases`.`ambiente_id` AS `ambiente_id`,
        `clases`.`periodo_id` AS `periodo_id`,
        `clases`.`responsable_id` AS `responsable_id`,
        `materias`.`nombre` AS `materia`,
        `materias`.`sigla` AS `title`,
        `materias`.`semestre` AS `semestre`,
        `materias`.`tipo` AS `tipo`,
        `materias`.`paralelo` AS `paralelo`,
        `materias`.`nivel` AS `nivel`,
        `materias`.`control` AS `control`,
        `materias`.`telecomunicaciones` AS `telecomunicaciones`,
        `materias`.`sistemas` AS `sistemas`,
        `responsables`.`titulo` AS `tituloResponsable`,
        `responsables`.`ap_paterno` AS `responsable`,
        `ambientes`.`nombre` AS `ambiente`,
        `ambientes`.`tipo` AS `tipoAmbiente`,
        `ambientes`.`capacidad` AS `capacidad`,
        `clases`.`daysOfWeek` AS `daysOfWeek`,
        `clases`.`startTime` AS `startTime`,
        `clases`.`endTime` AS `endTime`,
        `periodos`.`start_date` AS `startDate`,
        `periodos`.`end_date` AS `endDate`,
        `clases`.`color` AS `color`,
        `periodos`.`nombre` AS `periodo`
    FROM
        ((((`clases`
        JOIN `materias` ON ((`materias`.`id` = `clases`.`materia_id`)))
        JOIN `responsables` ON ((`responsables`.`id` = `clases`.`responsable_id`)))
        JOIN `ambientes` ON ((`ambientes`.`id` = `clases`.`ambiente_id`)))
        JOIN `periodos` ON ((`periodos`.`id` = `clases`.`periodo_id`)))