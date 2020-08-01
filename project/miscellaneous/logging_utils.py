def show_error(_):
    try:
        import os, sys
        exc_type, exc_obj, exc_tb = sys.exc_info()
        fname = os.path.split(exc_tb.tb_frame.f_code.co_filename)[1]
        m_str = str(exc_type) + " " + str(fname) + " " + str(exc_tb.tb_lineno)
        print(m_str)
    except Exception as e:
        print(e)
