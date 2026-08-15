Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5F527467F
	for <nova-gpu@lists.linux.dev>; Sat, 15 Aug 2026 05:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786770513; cv=none; b=D4RzIt/AppdEhuqnUDDquOiwMaXAUvt/wZ5o9Tvn5KJUwn9a8zobtVgaBgkFNZCk0okWFHGzvfJU0Z8CDktk4jbzkekpEey02UmwZcNnu6Gn6+BlrFzpKV3lGm9N80pUCxHpgDkfYSBr1cne1MQ9GuU5beW2zD9uYtHV8PfMRfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786770513; c=relaxed/simple;
	bh=3gtU+cy0ZJ+hiolSfLE6IUY68+TSR11bm8MWfskBrmI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=er+tmjNyjiWC3T2XhACK0yeyzRXLn4GznP0dLMGez0WZNc7VqNGwbh2b6/RRn8paBuRT3oV6UTnGMTWKbJ/Jgi43oJFGzrB1FnEGWEUnmSf1xSFdFp6X/3sRrUjJcoa4sNoQgIKSzhFSf7EhPUN4qbXoaZeoePNLALVSJbya9/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KefYJ2I8; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KefYJ2I8"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3a14c306efaso363351fa.0
        for <nova-gpu@lists.linux.dev>; Fri, 14 Aug 2026 22:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786770509; x=1787375309; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+Ki1f29ZNNzrhAw8g31VS5wgylnUVVZbopDUMwHeVLM=;
        b=KefYJ2I8+3GYAnUdxz82+YgS+mCTOpNGhfzv2ueaJf5T5p21prhLQ6bZbSToCUbAbd
         2TZE4RcHgayAnnWFVQnTeFBx1so0BU39xu0orVci79vvVvWur6xU3uKp6f98RwMFifGW
         EfN7V0b5uK3hJSMKci5e4F3El7AWfUtjuQKW9oHwH6CKaOxNPOE7TnYUbp1YCLjp4is7
         pqIO3TToeVgDnSHPiPOa0SAHD2S+vAYJ2kKQBeaqQTo5KKewtnbDstcZzbwIXBEd50mG
         8f/SCVPfw42GN0OS4yB56sHJOFvj1tKPDtco5vUliRO+8Pw/H7EA2TL5dhJO6B3og9Ht
         ee9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786770509; x=1787375309;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+Ki1f29ZNNzrhAw8g31VS5wgylnUVVZbopDUMwHeVLM=;
        b=H+fp1rKPLk/r1O5yQvri+4O8kevnN64V8CG1t+NjBBsh2LEvRulAqcHzfxHddiXtyE
         1gbsZXeRnmBgOtR+j//H+1w04ikfhL/dLx3DG4Oi3xBeKImy5QTWDwr+xlb07oxrKzXd
         B4DtKoGljJW52gYSVWdkt7T3F+laTo1Jojqz0aWX4MQpjf4lGHRrgqoENyZq1WlDHtTQ
         TzPTUUhwxGl4etzQVGaEZZ1kx+2n8E84aB95oEFWLt1bbSRDxA4UU2Jij68gY1JKtj2V
         PJ4muklCDw40pkVvyXdN0T54Y8UhZUw82OsRicH91/GdiMwIpUxRWMeL2UwyGFwVTAeY
         dvDw==
X-Forwarded-Encrypted: i=1; AHgh+RorS3sfIUkwfRqROyX57hL1HSF8CSPDTHz3Ogica0pv5aSCUKhADjE3wceT4PqPJKB9xJ1wznHf2A==@lists.linux.dev
X-Gm-Message-State: AOJu0YzDeOPXDU0hPs1kxCWhznsjk/iV3oxerDhssaL1Bq++3iY2PFLS
	0HSdRZG4bLnVZM+jWImL/xJqt0VCVTih3lpC51a/eXWOC7Jjx+Ppyxf4
X-Gm-Gg: AR+sD10E/1lQ3Ng0domKEwFKJmSdabH6gOTXkcx8PhdWxkOeHflKZGCuo3Ui8XkLoaP
	0VvR4+pjilnoN7oDutFejTtPs7spXecb3yyAf8MuIt8Ozx1nhoc4F49JZjTMeu9irA7LAHEdOxi
	rRqTa/rl0aZyHjbIsnG4QKOe4GjiPsxmFPjNUCyvfndNCgIJnTs/EWKgzkHoXK561G4jtoae482
	sen8QXoXfYxRNPXkQkHzrKFmtMOAKQtSsbdNTnmbymhQ4Lp2VEHN0wlSbctjTqbatYK2Rzwk9fL
	OQ3TiLsHSuoq3pDdTaEgRhyAfsidkSUXWH97byKspa6nXkwcVwkvccLnRKjw3/OXHN72XfHuc/4
	KMZ8q40jTU9uQ6/a2+bkv40cIKMsH3GCkI/u/QNnyA0Ctbfr8h1ZgodpK1jOV2c9rynQ5oVu2or
	IRn0QOuLU4RPUGMNrQpjRkBvdB7oyVpRMKcqfyVj6RuqhUGVJ4yV7p2Vb2lUdlfmZSACiso3ell
	3Ug+A==
X-Received: by 2002:a05:6512:3da4:b0:5b0:1879:1b9d with SMTP id 2adb3069b0e04-5b45913b940mr1711971e87.26.1786770508996;
        Fri, 14 Aug 2026 22:08:28 -0700 (PDT)
Received: from localhost ([95.190.110.153])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b458b9a9a7sm932354e87.13.2026.08.14.22.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 22:08:28 -0700 (PDT)
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
Subject: [PATCH v2 0/2] gpu: nova-core: retain the GSP-RM log buffers
Date: Sat, 15 Aug 2026 12:08:24 +0700
Message-ID: <20260815050826.306717-1-vladazaharova2018@gmail.com>
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

Patch 1 adds a gsp_keep_logs module parameter: when it is set, whatever
the GSP wrote is copied into memory owned by the module and exposed
under a "retained" directory until the module is unloaded. Patch 2 drops
the now completed task from todo.rst.

Changes since v1:
 - use a gsp_keep_logs module parameter instead of a Kconfig option, so
   that no kernel rebuild is needed
 - use VVec rather than KVec for the copies
 - move the log buffer code into gsp/logbuffer.rs
 - create the "retained" directory in module_init(), which removes the
   additional unsafe block from the teardown path
 - dev_dbg!() instead of dev_info!()
 - take every allocation that can fail before dropping a previous copy
   of the same device, so that running out of memory cannot leave that
   device with no logs at all

Two things did not make it into this revision:

The parameter is a u8 taking 0 or 1 rather than a bool. bool is not
available in this tree: the macro fails with "Unsupported parameter type
bool", as rust/kernel/module_param.rs only instantiates param ops for
i8..u64, isize and usize. There is a TODO in the code to switch over
once it arrives.

The dma_rmb() discussed on v1 is likewise not here yet, as the barrier
abstractions are still making their way in via the tip tree. I will send
it as a separate patch once the backmerge has happened.

Testing was done on top of drm-rust-next with the TLV firmware images
installed, which also settles the question left open on v1 about the
older base. On a GB203:

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
  - the copies are released on module unload, and three load/unload
    cycles leave nothing behind.

No warnings, oopses or refcount complaints in dmesg throughout. Built
and checked with CLIPPY=1 and rustfmtcheck. checkpatch --strict is clean
apart from the MAINTAINERS note for the new file, which is already
covered by the existing "F: drivers/gpu/nova-core/" pattern.

Vladislav Zaharov (2):
  gpu: nova-core: gsp: retain the GSP-RM log buffers after unbind
  Documentation: nova: remove completed GSP log buffer task

 Documentation/gpu/nova/core/todo.rst   |  12 --
 drivers/gpu/nova-core/gsp.rs           | 100 ++---------
 drivers/gpu/nova-core/gsp/logbuffer.rs | 235 +++++++++++++++++++++++++
 drivers/gpu/nova-core/nova_core.rs     |  28 +++
 4 files changed, 282 insertions(+), 93 deletions(-)
 create mode 100644 drivers/gpu/nova-core/gsp/logbuffer.rs

-- 
2.55.0

