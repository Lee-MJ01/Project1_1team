package service;

import java.util.List;
import dao.EnrollmentDAO2;
import dto.EnrollmentDTO2;

public enum EnrollmentService2 {
    INSTANCE;

    private EnrollmentDAO2 dao = new EnrollmentDAO2();

    public int getTotal() {
        return dao.selectCountTotal();
    }

    public List<EnrollmentDTO2> getEnrollments(int currentPage, int size) {
        int start = (currentPage - 1) * size;
        return dao.selectEnrollments(start, size);
    }
}
