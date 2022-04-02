/// @description Clean up particle system and delete

part_emitter_destroy_all(part_sys);
part_system_destroy(part_sys);

show_debug_message("Deleting plant");
instance_destroy();

