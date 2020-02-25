package protafolio.controller;

import java.io.Serializable;
import java.util.List;

import javax.ejb.EJB;
import javax.enterprise.context.SessionScoped;
import javax.inject.Named;

import portafolio.model.dto.Cliente;
import portafolio.model.manager.ManagerPortafolio;

@Named("cliente")
@SessionScoped
public class ControllerPortafolio implements Serializable {

	private static final long serialVersionUID = 1L;

	@EJB
	private ManagerPortafolio managerPortafolio;
	private List<Cliente> listado;
	private Cliente c = new Cliente();

	public void nuevo() {
		managerPortafolio.agregar(c);
		c = new Cliente();
	}

	public void borrar(Cliente cl) {
		managerPortafolio.eliminar(cl);
	}

	public void buscarId(Cliente cl) {
		this.c = cl;
	}

	public void actualizar() {
		managerPortafolio.modificar(c);
	}

	public List<Cliente> getListado() {
		listado = managerPortafolio.consultarClientes();
		return listado;
	}

	public void setListado(List<Cliente> listado) {
		this.listado = listado;
	}

	public Cliente getC() {
		return c;
	}

	public void setC(Cliente c) {
		this.c = c;
	}

}
