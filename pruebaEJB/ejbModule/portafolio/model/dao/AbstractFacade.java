package portafolio.model.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.criteria.CriteriaQuery;

public abstract class AbstractFacade<T> {
	private Class<T> entityClass;

	EntityManager em = getEntityManager();

	protected abstract EntityManager getEntityManager();

	public AbstractFacade(Class<T> entityClass) {
		this.entityClass = entityClass;
	}

	public void create(T entity) {
		try {
			em.getTransaction().begin();
			em.persist(entity);
			em.getTransaction().commit();
		} catch (Exception e) {
			if (em.getTransaction() == null && em.isOpen()) {

				em.getTransaction().getRollbackOnly();
			}
		} finally {
			if (em.isOpen() && em != null) {
				em.close();
			}
		}
	}

	public void update(T entity) {
		try {
			em.getTransaction().begin();
			em.merge(entity);
			em.getTransaction().commit();
		} catch (Exception e) {
			if (em.getTransaction() == null && em.isOpen()) {
				em.getTransaction().rollback();
			}
		}
	}

	public void delete(T entity) {
		try {
			em.getTransaction().begin();
			em.remove(entity);
			em.getTransaction().commit();
		} catch (Exception e) {
			if (em.getTransaction() == null && em.isOpen()) {
				em.close();
			}
		} finally {
			if (em != null && em.isOpen()) {
				em.close();
			}
		}
	}

	public List<T> mostrar() {
		CriteriaQuery<T> cq = getEntityManager().getCriteriaBuilder().createQuery(entityClass);
		return getEntityManager().createQuery(cq).getResultList();
	}

	public T findId(Object id) {
		return getEntityManager().find(entityClass, id);
	}
}
