package project.assay.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import project.assay.models.Person;

@Repository
public interface PeopleRepository extends JpaRepository<Person, Integer> {
}
