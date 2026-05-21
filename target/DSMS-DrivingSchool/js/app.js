function isBlank(value) {
	return value === null || value === undefined || String(value).trim() === '';
}

function setFieldError(inputId, message) {
	const input = document.getElementById(inputId);
	const error = document.getElementById(inputId + 'Error');
	if (input) input.classList.add('input-invalid');
	if (error) error.textContent = message || '';
}

function clearFieldError(inputId) {
	const input = document.getElementById(inputId);
	const error = document.getElementById(inputId + 'Error');
	if (input) input.classList.remove('input-invalid');
	if (error) error.textContent = '';
}

function clearStudentErrors(fieldIds) {
	fieldIds.forEach(clearFieldError);
}

function validateLettersOnly(value) {
	return /^[A-Za-z]+$/.test(String(value).trim());
}

function validateEmail(value) {
	return /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/.test(String(value).trim());
}

function validatePhone(value) {
	return /^[0-9]{10}$/.test(String(value).trim());
}

function validatePassword(value) {
	return /^[A-Z](?=.*[0-9!@#$%^&*]).{7,}$/.test(String(value));
}

function validateStudentAddForm(event) {
	const fields = ['username', 'password', 'firstName', 'lastName', 'email', 'phone', 'dob'];
	clearStudentErrors(fields);

	let valid = true;
	const username = document.getElementById('username')?.value || '';
	const password = document.getElementById('password')?.value || '';
	const firstName = document.getElementById('firstName')?.value || '';
	const lastName = document.getElementById('lastName')?.value || '';
	const email = document.getElementById('email')?.value || '';
	const phone = document.getElementById('phone')?.value || '';
	const dob = document.getElementById('dob')?.value || '';

	if (isBlank(username) || !validateLettersOnly(username)) {
		setFieldError('username', 'Username must contain letters only.');
		valid = false;
	}
	if (isBlank(password)) {
		setFieldError('password', 'Password is required.');
		valid = false;
	} else if (!validatePassword(password)) {
		setFieldError('password', 'Password must start with a capital letter and include at least one number or special character.');
		valid = false;
	}
	if (isBlank(firstName) || !validateLettersOnly(firstName)) {
		setFieldError('firstName', 'First name must contain letters only.');
		valid = false;
	}
	if (isBlank(lastName) || !validateLettersOnly(lastName)) {
		setFieldError('lastName', 'Last name must contain letters only.');
		valid = false;
	}
	if (isBlank(email) || !validateEmail(email)) {
		setFieldError('email', 'Please enter a valid email address.');
		valid = false;
	}
	if (isBlank(phone) || !validatePhone(phone)) {
		setFieldError('phone', 'Phone number must be exactly 10 digits.');
		valid = false;
	}
	if (isBlank(dob)) {
		setFieldError('dob', 'Date of birth is required.');
		valid = false;
	}

	if (!valid) event.preventDefault();
}

// Validation for instructor add form (similar rules but without DOB and with license number)
function validateInstructorAddForm(event) {
	const fields = ['username', 'password', 'firstName', 'lastName', 'email', 'phone', 'licenseNumber'];
	clearStudentErrors(fields);

	let valid = true;
	const username = document.getElementById('username')?.value || '';
	const password = document.getElementById('password')?.value || '';
	const firstName = document.getElementById('firstName')?.value || '';
	const lastName = document.getElementById('lastName')?.value || '';
	const email = document.getElementById('email')?.value || '';
	const phone = document.getElementById('phone')?.value || '';
	const licenseNumber = document.getElementById('licenseNumber')?.value || '';

	if (isBlank(username) || !validateLettersOnly(username)) {
		setFieldError('username', 'Username must contain letters only.');
		valid = false;
	}
	if (isBlank(password)) {
		setFieldError('password', 'Password is required.');
		valid = false;
	} else if (!validatePassword(password)) {
		setFieldError('password', 'Password must start with a capital letter and include at least one number or special character.');
		valid = false;
	}
	if (isBlank(firstName) || !validateLettersOnly(firstName)) {
		setFieldError('firstName', 'First name must contain letters only.');
		valid = false;
	}
	if (isBlank(lastName) || !validateLettersOnly(lastName)) {
		setFieldError('lastName', 'Last name must contain letters only.');
		valid = false;
	}
	if (isBlank(email) || !validateEmail(email)) {
		setFieldError('email', 'Please enter a valid email address.');
		valid = false;
	}
	if (!isBlank(phone) && !validatePhone(phone)) {
		setFieldError('phone', 'Phone number must be exactly 10 digits.');
		valid = false;
	}
	if (isBlank(licenseNumber)) {
		setFieldError('licenseNumber', 'License number is required.');
		valid = false;
	}

	if (!valid) event.preventDefault();
}

function validateStudentEditForm(event) {
	const fields = ['password', 'firstName', 'lastName', 'email', 'phone', 'dob'];
	clearStudentErrors(fields);

	let valid = true;
	const password = document.getElementById('password')?.value || '';
	const firstName = document.getElementById('firstName')?.value || '';
	const lastName = document.getElementById('lastName')?.value || '';
	const email = document.getElementById('email')?.value || '';
	const phone = document.getElementById('phone')?.value || '';
	const dob = document.getElementById('dob')?.value || '';

	if (!isBlank(password) && !validatePassword(password)) {
		setFieldError('password', 'Password must start with a capital letter and include at least one number or special character.');
		valid = false;
	}
	if (isBlank(firstName) || !validateLettersOnly(firstName)) {
		setFieldError('firstName', 'First name must contain letters only.');
		valid = false;
	}
	if (isBlank(lastName) || !validateLettersOnly(lastName)) {
		setFieldError('lastName', 'Last name must contain letters only.');
		valid = false;
	}
	if (isBlank(email) || !validateEmail(email)) {
		setFieldError('email', 'Please enter a valid email address.');
		valid = false;
	}
	if (isBlank(phone) || !validatePhone(phone)) {
		setFieldError('phone', 'Phone number must be exactly 10 digits.');
		valid = false;
	}
	if (isBlank(dob)) {
		setFieldError('dob', 'Date of birth is required.');
		valid = false;
	}

	if (!valid) event.preventDefault();
}

function attachLiveClear(fieldId) {
	const input = document.getElementById(fieldId);
	if (input) {
		input.addEventListener('input', () => validateStudentField(fieldId));
		input.addEventListener('blur', () => validateStudentField(fieldId));
	}
}

function validateStudentField(fieldId) {
	const value = document.getElementById(fieldId)?.value || '';
	const isEdit = !!document.getElementById('studentEditForm');

	switch (fieldId) {
		case 'username':
			if (isBlank(value)) return setFieldError(fieldId, 'Username is required.');
			if (!validateLettersOnly(value)) return setFieldError(fieldId, 'Username must contain letters only.');
			break;
		case 'password':
			if (isEdit && isBlank(value)) return clearFieldError(fieldId);
			if (isBlank(value)) return setFieldError(fieldId, 'Password is required.');
			if (!validatePassword(value)) return setFieldError(fieldId, 'Password must start with a capital letter and include at least one number or special character.');
			break;
		case 'firstName':
			if (isBlank(value)) return setFieldError(fieldId, 'First name is required.');
			if (!validateLettersOnly(value)) return setFieldError(fieldId, 'First name must contain letters only.');
			break;
		case 'lastName':
			if (isBlank(value)) return setFieldError(fieldId, 'Last name is required.');
			if (!validateLettersOnly(value)) return setFieldError(fieldId, 'Last name must contain letters only.');
			break;
		case 'email':
			if (isBlank(value)) return setFieldError(fieldId, 'Please enter a valid email address.');
			if (!validateEmail(value)) return setFieldError(fieldId, 'Please enter a valid email address.');
			break;
		case 'phone':
			if (isBlank(value)) return setFieldError(fieldId, 'Phone number is required.');
			if (!validatePhone(value)) return setFieldError(fieldId, 'Phone number must be exactly 10 digits.');
			break;
		case 'dob':
			if (isBlank(value)) return setFieldError(fieldId, 'Date of birth is required.');
			break;
		case 'licenseNumber':
			if (isBlank(value)) return setFieldError(fieldId, 'License number is required.');
			break;
	}

	clearFieldError(fieldId);
	return true;
}

// Delete Confirmation Modal Handler
let confirmDeleteCallback = null;

function confirmDelete(itemName, deleteUrl) {
	confirmDeleteCallback = () => {
		if (deleteUrl) window.location.href = deleteUrl;
	};

	const modal = document.getElementById('deleteConfirmModal');
	const itemNameEl = document.getElementById('deleteItemName');

	if (itemNameEl) {
		itemNameEl.textContent = itemName || 'this item';
		itemNameEl.style.display = 'block';
	}

	if (modal) modal.classList.add('active');
	return false;
}

function confirmDeleteAction() {
	if (confirmDeleteCallback) confirmDeleteCallback();
	cancelDelete();
}

function cancelDelete() {
	const modal = document.getElementById('deleteConfirmModal');
	if (modal) modal.classList.remove('active');
	confirmDeleteCallback = null;
}

document.addEventListener('DOMContentLoaded', function() {
	const addForm = document.getElementById('studentAddForm');
	if (addForm) {
		addForm.addEventListener('submit', validateStudentAddForm);
		['username', 'password', 'firstName', 'lastName', 'email', 'phone', 'dob'].forEach(attachLiveClear);
	}

	const editForm = document.getElementById('studentEditForm');
	if (editForm) {
		editForm.addEventListener('submit', validateStudentEditForm);
		['password', 'firstName', 'lastName', 'email', 'phone', 'dob'].forEach(attachLiveClear);
	}

	// instructor add form (admin page)
	const instructorAddForm = document.getElementById('instructorAddForm');
	if (instructorAddForm) {
		instructorAddForm.addEventListener('submit', validateInstructorAddForm);
		['username', 'password', 'firstName', 'lastName', 'email', 'phone', 'licenseNumber'].forEach(attachLiveClear);
	}

	const modal = document.getElementById('deleteConfirmModal');
	if (modal) {
		modal.addEventListener('click', function(e) {
			if (e.target === modal) cancelDelete();
		});
	}
});
