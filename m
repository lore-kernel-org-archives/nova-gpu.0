Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297342F8E94
	for <nova-gpu@lists.linux.dev>; Thu, 25 Jun 2026 19:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782414368; cv=none; b=p35ivsBHJaxpr9ya0u+fCFSiqmFm4+tw6CbpeRuiRgo0XDObvthSa+71gA3XjfcxGEn8ISfSuchZg3p3024lyK6MpDvKpypy5/vpZflN10SbvmI+jhLuJhBJJUFSVh6Bka5JijSY3XiFKQ7u+T7/7MyB/VBJ82Y+HM1DRdjMqTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782414368; c=relaxed/simple;
	bh=9Hfhgljl1UY5ILwqOqQyKOT7lHPCxq5wcO+q3ufQtUE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ODFtDAtrDPDmeZWCfgMBcoM3y3UgVQZI4OfqTEOO9HVAcJY3Nu+vM5VDfCBaqMTsPr6sC5lwSrRUQlSqSvMXyu52N5G/8GrwVOA9v4yB80C4ZwRby3Y4OciYGklEG+jGA8rv7h5wVyJlWVZgiXDflxEfv+upAN/QR9Cvkad0t/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=usp.br; spf=pass smtp.mailfrom=usp.br; dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b=arsuZtbA; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=usp.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=usp.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b="arsuZtbA"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1397e093f90so673415c88.1
        for <nova-gpu@lists.linux.dev>; Thu, 25 Jun 2026 12:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google; t=1782414364; x=1783019164; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nwvsRk5K8KQIV+dAnZZRDBwFar88HbSp2Pk4XHAfdBs=;
        b=arsuZtbAx90I0o3FgPu6nhbCLb0L40nrDGviGGoGOB9TMv0kf5k/FyZKRRhKrnw5V5
         hzsbE4IZdA7rCav9OO3IkmcITaygcvZ92pcBW2NROiymB6JJrSiOAPPD/vbZHyR5DVby
         jS8YoW7cxiF4sbSDSaj5aZpBjo4XSWPmfu56B1MlNVG0fiA1VzCXyqgLlB/iiDisMXmd
         N4iNHrIOAIxVSowTzhtuHJZtMKMmsff09LUXcVA8YYqL3o/XhaPOjgZteEhZ4etGyeFW
         ZHLuIwDdYr9k2QjMvTDNafr5t4Fuw84UBSEsBB0s3B39dxFcmzrkAQq6lKz628z4NkSG
         XiMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782414364; x=1783019164;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nwvsRk5K8KQIV+dAnZZRDBwFar88HbSp2Pk4XHAfdBs=;
        b=pPfwyyWOrWPQ5aFDqEhQSxBUlSQ5/GuPwVLXopYzVxLVx4Ljnju/C5sl7zYLfv34qJ
         Jwvxn8VIgCD+sOGFWXcEAILIay+OAp/oTRp8geK7Jb0NTbFzjDXJTOv0LaSQreuTk2Bp
         IcmR7B9a1Ard8hjlkWSzpOAIOJ1X0xylodJC0nlV1o2b2wKFr/jxgX+yUfWZ2yq9bIY8
         5JFrKiKhgBq/KwVtFUZC7eamBZ0Ud5rVcy/1aW2v9rKUbOg16uFca/5X/PK0q2lsP99x
         s4s9kUp2S7RzDYj8WB42JFMbXfHVQ2ZrKcR5TFTDS7VTbzhTdAyDXlU+jZ9TkEEMiFkJ
         Sw+w==
X-Forwarded-Encrypted: i=1; AFNElJ/PASjTBOaztWFguZ3XI6lOtnANsG70z+tL05bzdlIGniLeK3sHqL9fBD0nsBMO3TgPCZUEwdO6QA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyxJv3P7Z0RCovJxGh28M1t7p/PSxHZDe0fVoh+G+l2wBCqDCp4
	9pYlToiTWcqJoPT5zalFIqKV2yQYkupJ+EKs6EmeFegOAOysMHIZTbI+K6fLe1R/IGU=
X-Gm-Gg: AfdE7ck1/S6T/x+Y7O3ufyTXd5TS4INd+gjfjC0f5+NFywHaEy4RUZwUtR2jkIBeqWo
	4oCI2MENR2kOPW4jVwx2ihlIYMWY6FussBBzWU2y8JrF4xIvTKLPUASpem4CiOfxkEfOIKDl6Qd
	xbAF6+dvsQIztRWBH2N5d3CFrnxGPQtznJZC9r6ua6LtiP+6tgOV5b7BlL5wHhYQGB3gI626U9v
	e9m9VzU2YdrkgpxY2KSdgf8XqJ8CgFwiDihI5skbrKN+HAtXOAAjgSB/EG0PBVGRsXpsRrgsqf4
	VxSn7qS6qRf0F93zTDYyyaJTW2jMMMi6mhHhjKDbZGUvBSnUI2P6lO734dQVs7bey2S69kBuaAk
	MmDj+4ie2CfZLBP5F43tkPrQnX4+iwLrR99Gz8srDzusQZcOIyXp7k3FoUNv5oIz1YrgGkHvSaa
	vrFnl3GPuwzNt8GFfW7atDR+W17g==
X-Received: by 2002:a05:7022:459a:b0:137:6bdb:5842 with SMTP id a92af1059eb24-139db93fademr3208663c88.0.1782414363978;
        Thu, 25 Jun 2026 12:06:03 -0700 (PDT)
Received: from niyudi-linux.semfio.usp.br (nat.ime.usp.br. [143.107.45.1])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139d8f6acf9sm10742999c88.6.2026.06.25.12.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 12:06:03 -0700 (PDT)
From: Pedro Yudi Honda <niyudi.honda@usp.br>
X-Google-Original-From: Pedro Yudi Honda
To: dakr@kernel.org,
	acourbot@nvida.com,
	nova-gpu@lists.linux.dev
Cc: aliceryhl@google.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	ojeda@kernel.org,
	rust-for-linux@vgdm.kernel.org,
	Pedro Yudi Honda <niyudi.honda@usp.br>
Subject: [PATCH 0/7] drm/nova: replace `transmute` with `zerocopy`
Date: Thu, 25 Jun 2026 16:05:46 -0300
Message-Id: <20260625190553.7245-1-niyudi.honda@usp.br>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pedro Yudi Honda <niyudi.honda@usp.br>

This series follows the introduction of `zerocopy` to rust-next and
replaces `transmute` traits with `zerocopy` traits. These changes are
mechanical and don't alter functionality.

Specifically, the trait `transmute::FromBytes` is replaced by
`zerocopy::FromBytes` and the trait `transmute::AsBytes` is replaced
by `zerocopy::IntoBytes`. Additional traits such as
`zerocopy::Immutable` and `zerocopy::KnownLayout` are implemented as
necessary.

This does not replace the trait implemented in newtypes over
bindings. Currently, the only solution I can think of is mirroring
the bindings into another type and transmuting when necessary, but
that does not seem practical. Another issue is a type like
`gsp::cmdq::GspMem` that explicitly does not meet the requirements
for `FromBytes`, but unsafely implements the trait anyway because it
knows all of its uses. Unsafely implementing `zerocopy::FromBytes` is
not allowed, and implementing `zerocopy::TryFromBytes` would add
unnecessary overhead.

Feedback from the maintainers on the direction in these cases would
be appreciated.

Pedro Yudi Honda (7):
  drm/nova: use `zerocopy` in firmware.rs
  drm/nova: use `zerocopy` in vbios.rs
  drm/nova: use `zerocopy` in booter.rs
  drm/nova: use `zerocopy` in fwsec.rs
  drm/nova: use `zerocopy` in bootloader.rs
  drm/nova: use `zerocopy` in riscv.rs
  drm/nova: remove unused trait in commands.rs

 drivers/gpu/nova-core/firmware.rs             | 16 ++---
 drivers/gpu/nova-core/firmware/booter.rs      | 26 +++-----
 drivers/gpu/nova-core/firmware/fwsec.rs       | 47 ++++-----------
 .../nova-core/firmware/fwsec/bootloader.rs    | 16 ++---
 drivers/gpu/nova-core/firmware/riscv.rs       | 10 +---
 drivers/gpu/nova-core/gsp/commands.rs         |  9 +--
 drivers/gpu/nova-core/vbios.rs                | 60 ++++++-------------
 7 files changed, 49 insertions(+), 135 deletions(-)

-- 
2.34.1

