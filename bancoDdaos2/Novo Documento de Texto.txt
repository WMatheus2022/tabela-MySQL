select nome_alunos, nome_disciplina from alunos
inner join disciplinas
on disciplinas.id_diciplina = alunos.disciplinas_id;