locals {
   instance = {
    id = data.terraform_remote_state.server.outputs.id
    ami = data.terraform_remote_state.server.outputs.ami
    arm = data.terraform_remote_state.server.outputs.ami
   }
}