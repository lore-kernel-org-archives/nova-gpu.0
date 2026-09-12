Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45EC22EBDE9
	for <nova-gpu@lists.linux.dev>; Sat, 12 Sep 2026 07:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789197528; cv=none; b=c3lFycF1yVoOQJcTtvr5Qrqx6e2g9Ye9zRzFaH11sRZtOYnPu+P/Mk57YDegVb609/1TUHTu+xP0tUUdF7/KUXdqqYts9RIO4cAQYtkW2xUpy9rlQOqu6QK7fVwIsqUh2Cb+gVcVG00mNeYyCg/Z8v40q83spXhj1/7Qjhd3SMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789197528; c=relaxed/simple;
	bh=bTCuT3YDfl2lby7IRjjh/svKRwiHY4G7WKEbHKZAxrU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n0mDG5I3nipdqnORrWjtYfjT9Iu+9BydQd67eaKDZXOEtb3WrpVmW8dn0rAkQtBtuT2W2qqjk2MYdafrtMFbV5h736y4xzWLsLRHrhH8aLsI8kwcZru1DUFKQ5RC9R9y8MXeg4I70BtNdW8KQwLDJ2XRxAvOM6UxU8ftrZeChuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kDY9IwZ0; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kDY9IwZ0"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f16f12so695719e87.1
        for <nova-gpu@lists.linux.dev>; Sat, 12 Sep 2026 00:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789197525; x=1789802325; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rLeyn0OC1le5MSTZk6KLze1f/9azpPHpmNeLJDOBQ0U=;
        b=kDY9IwZ0GMd5ob5/5sokScb7kZAPE+sGBjMXMEsylqOy1YpS06Ao0rHTvVV4FB/pJo
         pnJ48Awd/vcWlr0yqawxd9BgDV2Z3v38BFbib3YgkaFrPpQRMEweteCPu9lPAg8YfYH+
         MonKA+lIVfp+qkKIYjrHhE6O/gFUDE1kGfX6uO0UnGPy3gtg1yCwvkLHmeYEVZI7sO1h
         g2RygbwX2rW6H5u3AERzTCIwK3SvxjhYeJ3SGkHLzm8wml4QTWdfqvcfIin0P4pQA4Co
         vtQRg7CTmbgkhowCASkKJzByaOtzeg3ykuMHG+3NEL4lOp6EJ7FZ6MZ3KMnAzbCuJjL7
         y92Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789197525; x=1789802325;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rLeyn0OC1le5MSTZk6KLze1f/9azpPHpmNeLJDOBQ0U=;
        b=OuTJ5XkkoKAlKPriwEfbGGI7Fs1v6QdvubEZh4KyIzsLAxaepahf+Z6dKIgIlihBE3
         as20cajX3NXzdROXoDL8TQJvOiek+OVTi4SmWgwbVrAKOmb1BSmdwOiRg2mMMQtmejhx
         9TATjUyVTemPcdv4tX4xZr1nMI7/81mm+pz3sdISBGXcsdDXLOp2//ABwmHeyz/odz9z
         3r0hc7LCp/pJ0ItSwgc2uzxU/oc6qXHm8fuHSvfi67Y9ejqjk45RxuIoer+mXP4BC5Ev
         JkUzJ3Ro+ECt7jST4VAEI/DPzALm7e8B/ul4bmtV3mLYt3+foIfmwPZ7f671CGrtmsyA
         iHWw==
X-Forwarded-Encrypted: i=1; AKwUvBxFhkv7dmCazMktx/5qcGnmX7xDEdDhJMiPHZ2yoBQ5lyuH5PkL1Jy/s6dN55dOLbq1wOzEHr0uxA==@lists.linux.dev
X-Gm-Message-State: AFuF++nasUe36uMA2YaeFoKG9HQRRMuKM5NAtNl79lhDznhCX8w6rZWk
	O8liXDWS2nOQOTCPsffbe8K/UEXdlCLNE/5NlgVNhkWUVCXi3HKDa7q8
X-Gm-Gg: AYBFou3LKsA8JebiChM6qnwOko6XXsXEUvfOfDkbOYJFe9kK2csrUZ2b5TGVn0CgRuf
	gpy10smnPhTKyuELp5dhojKeB7QIaPOUOP3ajX0IHq0GkjiUtjmdR6A+TJcTJl3LiWtgacOKMUx
	On84bVusoXsKO2WINizZpdXkP6ZFhJabtrNZkkjkyq+5w7mvf226hRxskZl19BhV8J+0J7Sko7P
	ccNcod3Vuxny8idPkIFGYYagL38hlWg+IdBmkU0CL3jdjvGFmIR6XJpH4QEfR4l2AQ53tf8kLei
	zEveoUqp1gCs1ggo8S4As0qcbt8OHa0gTxFMxjkzUu8Yx0m+ysxe2N5oLv2c1i+iNCaPilvoq/G
	vdB5OM3yP+Gz+K4H1MssErRWUtjTI1USrJ5JJpU+M7ToGhItbHk0bdALnKExJRvCQNFl6I+4s6u
	bWYCZ/gSOumXOHmAS+cJfFKZ36jI+cwqTmdiwGA9Gm1FFJVz4imkANPA3BjQUR7T+cmQwPCBeDT
	kfdvg==
X-Received: by 2002:a05:6512:3b87:b0:5b8:9ee1:10fd with SMTP id 2adb3069b0e04-5b8a0343aefmr3048202e87.32.1789197524822;
        Sat, 12 Sep 2026 00:18:44 -0700 (PDT)
Received: from localhost ([95.190.112.239])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a04571b0sm1096277e87.13.2026.09.12.00.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 00:18:44 -0700 (PDT)
From: Vladislav Zaharov <vladazaharova2018@gmail.com>
To: dakr@kernel.org,
	jhubbard@nvidia.com
Cc: acourbot@nvidia.com,
	aliceryhl@google.com,
	ttabi@nvidia.com,
	gary@garyguo.net,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Vladislav Zaharov <vladazaharova2018@gmail.com>
Subject: [PATCH v3 0/3] gpu: nova-core: retain the GSP-RM log buffers
Date: Sat, 12 Sep 2026 14:18:39 +0700
Message-ID: <20260912071842.622696-1-vladazaharova2018@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GSP-RM log buffers are exposed through debugfs, but the entries are
owned by the Gpu that probe() builds, and the buffers themselves are DMA
allocations that cannot outlive the device. They are therefore gone as
soon as the GPU is unbound, and in particular as soon as probe() fails -
which is the case todo.rst singled out, and the one where a GSP log is
worth having.

Patch 1 is a fix this series needs: init() builds the Registration before
the guard that clears the debugfs root, so a registration that fails
leaves the root behind with nothing left to remove it, and the next load
finds the name taken. Patch 2 adds a gsp_keep_logs module parameter: when
it is set, whatever the GSP wrote is copied into memory owned by the
module and exposed under a "retained" directory until the module is
unloaded. Patch 3 drops the now completed task from todo.rst.

Changes since v2:
 - rebase onto current drm-rust-next, where Coherent carries the lifetime
   of the bound device; the live log buffers borrow the device rather
   than holding a reference to it, and only the copies keep one
 - make gsp_keep_logs a bool, now that module parameters support it
 - add the dma_rmb() discussed on v1, as dma_mb(Read), between reading
   the "put" pointer and copying the buffer
 - build the debugfs guard before the Registration (patch 1), so that a
   failed module init cannot leave either directory behind
 - keep nothing when CONFIG_DEBUG_FS is off, where a Dir is a zero-sized
   type and the copies could never be read back
 - take the snapshots before acquiring the global lock, rather than
   holding it across three 64 KiB allocations

Testing was done on top of drm-rust-next with the TLV firmware images
installed. On a GB203:

  - with gsp_keep_logs unset, no "retained" directory is created and the
    entries disappear on unbind, as before;
  - with gsp_keep_logs=1, retained/<BDF>/{loginit,logintr,logrm} hold
    the contents the live entries had, all 64 KiB of each readable;
  - binding the GPU again recreates the live entries without disturbing
    the copies, and unbinding it a second time replaces them, leaving
    exactly one set behind;
  - with a failure injected after the GSP has booted, probe() fails with
    -EINVAL, the driver stays unbound, and the logs of that attempt are
    still readable;
  - with a failure injected into the Registration instead, the module
    fails to load and leaves no debugfs directory behind, where before
    patch 1 the next load would have found the name taken;
  - the copies are released on module unload, and three load/unload
    cycles leave nothing behind;
  - 1, Y and y turn it on, 0 and N turn it off, and a value that is
    neither is refused at load time.

The parameter does need a value: the Rust bool param ops do not set
KERNEL_PARAM_OPS_FL_NOARG, so a bare gsp_keep_logs is refused, where the
C bool would have taken it.

No warnings, oopses or refcount complaints in dmesg throughout. Built and
checked with CLIPPY=1 and rustfmtcheck. checkpatch --strict is clean
apart from the MAINTAINERS note for the new file, which is already
covered by the existing "F: drivers/gpu/nova-core/" pattern.

John Hubbard's r000 series adds three more log buffers in gsp.rs.
Whichever of the two lands second needs a small rebase; the retained
copies extend to the new buffers by adding them to RetainedLogBuffers.

v2: https://lore.kernel.org/nova-gpu/20260815050826.306717-1-vladazaharova2018@gmail.com/
v1: https://lore.kernel.org/nova-gpu/20260812113752.532537-1-vladazaharova2018@gmail.com/

Vladislav Zaharov (3):
  gpu: nova-core: build the debugfs guard before registering the driver
  gpu: nova-core: gsp: retain the GSP-RM log buffers after unbind
  Documentation: nova: remove completed GSP log buffer task

 Documentation/gpu/nova/core/todo.rst   |  12 --
 drivers/gpu/nova-core/gsp.rs           | 100 ++-------
 drivers/gpu/nova-core/gsp/logbuffer.rs | 267 +++++++++++++++++++++++++
 drivers/gpu/nova-core/nova_core.rs     |  36 +++-
 4 files changed, 320 insertions(+), 95 deletions(-)
 create mode 100644 drivers/gpu/nova-core/gsp/logbuffer.rs


base-commit: 73e5616f3d197c1af5a04a481fe0f13aa3913bd1
-- 
2.55.0

