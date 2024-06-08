output "cluster_name" {
  value = aws_ecs_cluster.cluster.name
}

output "service_name" {
  value = aws_ecs_service.service.name
}

output "repository_url" {
  value = aws_ecr_repository.hello_world_repo.repository_url
}
