Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5435542C512
	for <nova-gpu@lists.linux.dev>; Wed, 12 Aug 2026 11:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786534679; cv=none; b=VwIykytBVD5RdQu25M5wx1v/Ws9t8aumeZg/PtaMbMAPY9EDXboSv+5WfKjo/3z4gyQx66pkYwmBee8Y05kbaB83aqHFUWu/4absLTgCFe1Uqq4sVWHoBuifxCLWwFplYctaDbvYcU+xfKZeu2Pfekq40A5rLuaZgDjiFntU/lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786534679; c=relaxed/simple;
	bh=ZACaCqxrHuvlYmnW+yEEfmS9VfnqhzGc5sDwLqfSt5g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aby0fT1U1bfcCsncbAw4Z9M5kh709+OqQFX5s4iG8s5jDWHn04oyf3Ab1C8Zp+oGzFHwhJ8doxr6TQ3X/RioN2+nxahn/j89FWw1mwMt98/9xG/73M4RgZvwRwqtwvern4SQan5U8nFSStoztkDhorSjGhgFrHCqlbIcslDHczk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q9TS9z1C; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q9TS9z1C"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-39c8ee87f7eso8190641fa.3
        for <nova-gpu@lists.linux.dev>; Wed, 12 Aug 2026 04:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786534675; x=1787139475; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vcy0V4sanVWnhAv8P2awTDxn202Hp42bIgbbeqoNGH0=;
        b=Q9TS9z1CdEqB3c3So2NLsegjnNbOu4SAgbScsvsT0VZ3YqMoGwB0BC2cHOu/Ccgz3C
         yNhs0Z/RsmqqhEHudX/28PJCgkdEov7jesL8/Q2JRQiMAWwlt1DJ9bk6u3WXBNLtE0Op
         lK7vswx9LcaLDx+zEkf2kdoPJEbjIOxQpdheUloch3yEW4IrjioGJPXu8tyXGnTnli8p
         wnLkm6XM8qRES0w3qQHza9r7yRSQa7izFrIzFe3BJS4IaFkDEv51iKkCuLOCgPVLMgl+
         SKDZ2rwEfuKahgTN1HcvCqELY3dMsquZRYuqamOqYWdmSIDfMNC6/B4vGMCCthOagL6c
         Zd1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786534675; x=1787139475;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vcy0V4sanVWnhAv8P2awTDxn202Hp42bIgbbeqoNGH0=;
        b=XakBwMWPTJhkrzdfvYmWejjSZOgybh1oz/nk9tLMHoZULN2cGoMEGHVVEN5RM7WjYR
         xe/47qs/0PsZmysTxQJrqO62/J5NtoYtkmNBhR/AcmWgZ+raTQOp6DnmLY7Af6BGQFb2
         PrcodY0XfbhjWK6tU24YTE062btghmkAWiWV9KT1VTMGi81jE+zTRgtdEuhJ/L7BPeXV
         K3tRbYwbo0g3Mljc4BwWBXlw7B7Qw5fsY7Od4hOVFX+FkwnwKt8RqhA1CJ84IxPkzXJA
         Waa1OYYAHucPn7bP3mrQGlcIt6J2o14gBtw3dUYFM4877qcQplp1ZfKA4uAMwlJa7H3n
         Q8uw==
X-Forwarded-Encrypted: i=1; AHgh+RqjyeDpNHM8zJDjYtXONxFNUaRB7zLurqpY4fSOMdesarDl0hMnnYRX6vWCSnG7320dC4UABKxyjQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzN16N5XBgp9d0y5zj/6ENLem9Y066UTWuHhgGs+otWK5XURxzs
	ionW1yczQP7nXWKAPjI05DhYD0JXvzdD/Lq//kUX1rBXtsq8fS4t2Hqd
X-Gm-Gg: AR+sD10f352sJpMzVqTMIrM+rcU+eoSCsCn7ejNKDkUkMyhRIECXy8AP+PEWaetxja2
	+q/alisRvzGFOw6kJ2D4yS356PJEAoLpHBQol5q1/QG1XIqJzROJ7oEt6umlClevHpDkJeCLalL
	kvGjL+7WGlS74LepTXEjrSc8KNaHAb9bGC3JiOgQT7lLmWMOlD9+s4zTbSEMDpvCyIlZSm2xnpv
	CurpEJ4j8cMJdkwjE7IqnNiYUs0nnCWxtDCfIj61HDpoqgukFzcYXjG0QgPDGoxG8UDN5WKsvxm
	2z+iytEKsQWtoM/sYuJsDLHo1dDeppEhdVTwB7f847lZhI9r4yBX6BliNqZtmuKWlVilZox/DHR
	17lAVZvQ4A/adD+9qjfA6wtubcgXnyQP359201Yb5semXQrHF064OcWB3oifU9qCDptOrEgUGPq
	it2LlCW8Drpn5qWgjW0ngIjuKVsyucmJ5EI1kPVL+Jj+2jfWRkQXt9fm9H/mj3RuOVF+w2xshuT
	wMIdM0=
X-Received: by 2002:a05:651c:2121:b0:3a1:476:74b3 with SMTP id 38308e7fff4ca-3a10d4aa3e3mr4393061fa.9.1786534674956;
        Wed, 12 Aug 2026 04:37:54 -0700 (PDT)
Received: from localhost ([176.210.177.198])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a1082d11b9sm3881101fa.33.2026.08.12.04.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 04:37:54 -0700 (PDT)
From: Vladislav Zaharov <vladazaharova2018@gmail.com>
To: dakr@kernel.org,
	acourbot@nvidia.com
Cc: aliceryhl@google.com,
	ttabi@nvidia.com,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Vladislav Zaharov <vladazaharova2018@gmail.com>
Subject: [PATCH 0/2] gpu: nova-core: retain the GSP-RM log buffers
Date: Wed, 12 Aug 2026 18:37:50 +0700
Message-ID: <20260812113752.532537-1-vladazaharova2018@gmail.com>
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
which is the case todo.rst singled out ("even after failure to probe the
driver"), and the one where a GSP log is worth having.

Patch 1 adds CONFIG_NOVA_CORE_KEEP_GSP_LOGS: when the log buffers are
dropped, whatever the GSP wrote is copied into memory owned by the
module and exposed under a "retained" directory until the module is
unloaded. Patch 2 drops the now completed task from todo.rst.

nouveau has the same feature behind its keep_gsp_logging module
parameter. It recreates the entries under the name of the GPU that just
went away, which collides with that GPU coming back; the "retained"
directory here avoids that.

Tested on a GB203 (RTX 5080), which the driver probes successfully:

  - after an unbind, retained/<BDF>/{loginit,logintr,logrm} hold the
    contents the live entries had;
  - with a failure injected after the GSP has booted, probe() fails and
    the logs of that attempt are still readable;
  - binding the GPU again does not disturb the copies, and unbinding it
    a second time replaces them;
  - the copies are released on module unload, with nothing left behind;
  - with the option off, the entries disappear on unbind as before.

Built and checked with CLIPPY=1 and rustfmtcheck for both settings of
the new option.

The testing was done on top of e6c2c6265521 ("rust: firmware: add
request_into_buf()"), that is, before the TLV firmware series, because
the nvidia/*/gsp/*.tlv images are not in linux-firmware yet and the
driver therefore cannot load firmware at the current tip. The series
applies and builds unchanged on top of drm-rust-next.

Vladislav Zaharov (2):
  gpu: nova-core: gsp: retain the GSP-RM log buffers after unbind
  Documentation: nova: remove completed GSP log buffer task

 Documentation/gpu/nova/core/todo.rst |  12 ---
 drivers/gpu/nova-core/Kconfig        |  18 ++++
 drivers/gpu/nova-core/gsp.rs         | 146 +++++++++++++++++++++++++++
 drivers/gpu/nova-core/nova_core.rs   |  19 ++++
 4 files changed, 183 insertions(+), 12 deletions(-)

-- 
2.55.0

