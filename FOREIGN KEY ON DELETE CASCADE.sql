ALTER TABLE groupcourses ADD FOREIGN KEY (course_id)
    REFERENCES courses(id) ON DELETE CASCADE;

    ALTER TABLE groupexams ADD FOREIGN KEY (course_id)
    REFERENCES courses(id) ON DELETE CASCADE; --THIS DELETES THE FOREIGN TABLE rows

    DELETE FROM courses WHERE name LIKE '%-toremove';


    SELECT group_id, course_id
      FROM groupcourses
     UNION
    SELECT group_id, course_id
      FROM groupexams
     ORDER BY group_id, course_id;



--on DELETE SET NULL
ALTER TABLE branches ADD FOREIGN KEY (branchtype_id)
    REFERENCES branch_types(id) ON DELETE SET NULL; --THIS DO NOT DELETE THE FOREIGN TABLE rows BUT UPDATES THEM TO NULL

    DELETE FROM branch_types WHERE name LIKE '%-outdated';

    SELECT * FROM branches
    ORDER BY branch_id;
