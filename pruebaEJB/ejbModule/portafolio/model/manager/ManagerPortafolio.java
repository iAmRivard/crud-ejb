package portafolio.model.manager;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import portafolio.model.dao.ClienteFacade;
import portafolio.model.dto.Cliente;

@Stateless
@LocalBean
public class ManagerPortafolio {

	private Cliente c;
	private ClienteFacade cf;
	public List<Cliente> listaCliente;

	@PostConstruct
	public void init() {
		c = new Cliente();
		cf = new ClienteFacade();
		cf.mostrar();
	}

	public List<Cliente> consultarClientes() {
		this.listaCliente = new ArrayList<Cliente>();
		return this.listaCliente = cf.mostrar();
	}
	/* Agregar */

	public void agregar(Cliente cl) {
		try {
			cf.create(cl);
			init();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/* Eliminar */
	public void eliminar(Cliente cl) {
		try {
			cf.delete(cl);
			init();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/* Buscar por ID */
	public void findId(Cliente cl) {
		System.out.println("METODO FIND ID " + cl.getId());
		try {
			this.c = cl;
			System.out.println("Resultado: " + c.getNombre());

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	/* Actualizar */
	public void modificar(Cliente c) {
		try {
			cf.update(c);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
