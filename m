Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2D633938B
	for <nova-gpu@lists.linux.dev>; Sun, 13 Sep 2026 18:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789324670; cv=none; b=gbg/urCS9Uxf1hCF1QvW9aITFZO6gVCEIK0SJ1DaqdYCAFqa6EmsnZPBF+tZMQpSIG2qwowyRgtwlmZHUHvzH/QrDAFx9FHQBlBArvj8bbt6maRcYDuCr7bXGlX5lqU5ycySxkUOXXPS7AqsozsOX0V0J7EXan9yUyHaOkMli+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789324670; c=relaxed/simple;
	bh=Q1Lvvh0J91p4IBd0tHJVInbms5W5qkkgLtxjQuVBLKA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Tta+TTQL5Brel8uB8o2V/yZOTk4tonjxUHKSW++SeaQD1Gi8xpU9OimWH23JWYA6llRTA2+VWVlEeCowLF3WGBUZ15Wqa+Iu21y2O+MQop92Pfz5cdqtCSwuUl7il8Nrkb471Nxe+LwhBSw+QUGKkqwoAJmhahyU8tFZTbUO4s4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a6O1YcWG; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a6O1YcWG"
Received: by mail-pz2-f43.google.com with SMTP id 41be03b00d2f7-cc4c3304833so965348a12.3
        for <nova-gpu@lists.linux.dev>; Sun, 13 Sep 2026 11:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789324668; x=1789929468; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=d+o4MSkuQ8bnuoNbaiZq6FM4PPIv2ZxLKihE5535AIA=;
        b=a6O1YcWGwYSLUZT980tESdzTg4YFUpzXuDEroV2WEXKiUlrxkvAu/nQQhGntuWsHn5
         AmaFw+4D41tIac3FIJAXJOMr4vWTK5oyK760Nf1GR6IK90mREkQyeyuSHqT+Tz25M0ia
         dSKW1UzwgfWdODCwnxqwaR2r/EpTAZ1XZsyWSbSoDAwj8+wmhzGIbvuT9eJqximOjRIB
         /RVO+7qJ1J/CMW+w0HSTyCNMQZfjJULzUQeZafiqUKnatpD/HqGYyeRZMHUWeQs+4DkW
         ZuSskYRm2xo79JX3EN5zUEgkwP/kS1Zt7iB0z1XfaP84nPtIxb09gSsiWPQmDMHs6aD9
         x1PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789324668; x=1789929468;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d+o4MSkuQ8bnuoNbaiZq6FM4PPIv2ZxLKihE5535AIA=;
        b=dKsn86Lf92nbw2orKc8UbJxVTEsxjiGgMsuB47iafGKWUA0f4Zpy4IP860CSBab6/p
         4unjRfcDJIkpgRamU7nknr/1+cPdtwOkA89DWNySzSJSBUf8xkJIRakQb5prCiquCFbm
         RCvDU1e7kt1GTUEE4Y+GCT59191NNX+UL4KPnkGZ0u4vPEi1gI9J2pvTE7G85YWiHz37
         O0lsuHvmkShaF130CLbQpRUo9rtKvEPDTVWDehGADoXc/CC+uxQCmmZOsTH7xM8JRBSj
         AJ5kWnm59rK8+MHcDNgQYPOpO3vLElv19dqbLAqtpTRQb/iabdmnS1FibwYg5pFm6jXl
         01aQ==
X-Forwarded-Encrypted: i=1; AKwUvBxk8lit5YidfgHnAhVvMTxKYLrm7CZWOxXDgEF80jv5sFlBdGF/AcbpHt+EEH5AfVgOuN5xFbRXlg==@lists.linux.dev
X-Gm-Message-State: AFuF++lkUnQE1C66sr+MprLw0fpwkG3dvE+V2zV9bdbOhCHRq1pN2Kqt
	AJ3leVRjgXRr/36PjgnXHX3C4HpaIgt5CnCujFjI/QNM2dRSGB8yZ6UX
X-Gm-Gg: AYBFou3RKA+b/nRuJ/VacNBzo+bpW84MZY5DgGDTpWJMk0pJdEh7EY7969BDQ+X6ODm
	T9i+Ah/UCrendbRniaEC76uOUWepoyw2ZvZjkU0dITig+7UYqvneMUe8J6SYxrsVmuHmImlTvFO
	VVWnUrfNdVkmHX/TLdOANHDQALexX6CeeefKmX/Q+sSLK6ox4wQWYPIqtYwL/m7XtBJdj8CwCme
	ARCTtKHrdYYe0BqV+SIbz368oexl+dwzxp7La9Wywf/yGZggU65VdcebW1HSgBtM2BSXVFVbLFD
	+s+v9PIj2P2pKda4og/tZuYKf5M9XTz+8yke9HoYFd645lrTg0ZVCJRWjiLdTYdmCPR2mFivexY
	dpSBicm1pcdYVtpOa6NQalRBWYrmm8W+r7bDx8gsJ+o0O8/tooKk1EgRfSgQ0qZ0gUOKJ3ArydC
	LtoupEFTL6fcYxETcdCnFn+bL4D2KpRczi9ZQFrTF3U0kcUihzME9I5zPrVFz8sh/uTb/I6RJeO
	/4zvQ==
X-Received: by 2002:a17:90b:4990:b0:38f:de97:b06 with SMTP id 98e67ed59e1d1-39dbbe8b896mr14518295a91.5.1789324667744;
        Sun, 13 Sep 2026 11:37:47 -0700 (PDT)
Received: from localhost ([95.190.112.239])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d9b08165fsm4118447a91.1.2026.09.13.11.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 11:37:47 -0700 (PDT)
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
Subject: [PATCH v4 0/3] gpu: nova-core: retain the GSP-RM log buffers
Date: Mon, 14 Sep 2026 01:37:31 +0700
Message-ID: <20260913183734.134307-1-vladazaharova2018@gmail.com>
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

Patch 1 gives the module data a DebugfsData that owns the debugfs root,
replacing the static that held it. Patch 2 adds a gsp_keep_logs module
parameter: when it is set, whatever the GSP wrote is copied into that
same DebugfsData and exposed under a "retained" directory until the
module is unloaded. Patch 3 drops the now completed task from todo.rst.

Changes since v3:
 - keep the copies in the module data rather than in a second global.
   The debugfs root moves there too, so one pointer now replaces both
   statics, and the global lock and its unsafe initialization are gone
   (Gary Guo)
 - with that, the module data owns the root and is dropped after the
   registration, so a module init that fails can no longer leave the
   directory behind. v3 fixed that by ordering the fields of the module
   data; it now follows from where the root lives, and the guard type
   is gone
 - keep a copy of the device name with the retained copies rather than
   a reference to the device, so that a GPU that is gone does not stay
   allocated until the module is unloaded
 - drop a re-check of the retained directory that could not fire

The pointer is published from inside the initializer of DebugfsData,
through the `&this in` form, and it is a raw pointer rather than a
reference: pin-init does not allow references to fields to be created
inside an initializer. Readers turn it back into a reference in one
place.

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
    fails to load, leaves no debugfs directory behind, and the next load
    comes up with its directory intact;
  - the copies are released on module unload, and three load/unload
    cycles leave nothing behind.

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

v3: https://lore.kernel.org/nova-gpu/20260912071842.622696-1-vladazaharova2018@gmail.com/
v2: https://lore.kernel.org/nova-gpu/20260815050826.306717-1-vladazaharova2018@gmail.com/

Vladislav Zaharov (3):
  gpu: nova-core: move the debugfs root into the module data
  gpu: nova-core: gsp: retain the GSP-RM log buffers after unbind
  Documentation: nova: remove completed GSP log buffer task

 Documentation/gpu/nova/core/todo.rst   |  12 --
 drivers/gpu/nova-core/gsp.rs           | 100 ++--------
 drivers/gpu/nova-core/gsp/logbuffer.rs | 253 +++++++++++++++++++++++++
 drivers/gpu/nova-core/nova_core.rs     | 109 +++++++++--
 4 files changed, 362 insertions(+), 112 deletions(-)
 create mode 100644 drivers/gpu/nova-core/gsp/logbuffer.rs


base-commit: 66a2c223b620d844fe26c6bd4844d2a6a8c9dffc
-- 
2.55.0

