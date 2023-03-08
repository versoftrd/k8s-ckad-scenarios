> Secret, Secret-Volume, Secret-Env

You need to make changes on an existing Pod in Namespace `moon` called `secret-handler`. Create a new Secret `secret1` which contains `user=test` and `pass=pwd` . The Secret's content should be available in Pod `secret-handlers` as environment variables `SECRET1_USER` and
`SECRET1_PASS` . The yaml for Pod is available at `/opt/course/secret-handler.yaml` .

There is existing yaml for another Secret at `/opt/course/secret2.yaml` , create this Secret and mount it inside the same Pod at
`/tmp/secret2` . Your changes should be saved under `/opt/course/secret-handler-new.yaml` . Both Secrets should only be available in
Namespace `moon` .
