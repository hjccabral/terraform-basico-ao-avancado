# Terraform Commands 

Projeto simples para criação de 3 Buckets S3 na AWS.

Esse projeto server somente para testes de comandos:

```bash
terraform show                                 # formato mais humano para os recursos que estão criados no terrafom
terraform state ls                             # lista os recursos criados pelo terraform
terraform state mv                             # server para modificar o nome de um recurso do terraform
terraform state pull > tf.tfstate              # Salva o state file (que normalmente está em um bucket) localmente
terraform state push state tf.tfstate          # Fazer push de um arquivo local para o repositorio remoto do terraform
terraform state push state -force tf.tfstate   # O mesmo que o comando anterior, porém com a opção force.
terraform state replace provider registry.terraform.io/hashcorp/aws registry.terraform.io/hashcorp/aws-v2
                                               # Força a troca de provider de um terraform state
terraform import aws_s3_bucket.bucket-3 hilton-tf-bucket-3        
											   # Importa um recurso não gerenciado pelo tf para dentro do tf state
terraform state rm aws_s3_bucket.bucket-3      # Remove o bloco de código do terraform state
terraform refresh                              # Faz refresh do que está implementado no providor para o que há no tf state
```