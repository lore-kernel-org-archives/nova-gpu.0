Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1DCC480DEA
	for <nova-gpu@lists.linux.dev>; Thu,  2 Jul 2026 12:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782993943; cv=none; b=glXCZ1r4kgQ+aDriL/JUeM4VpYGpvbKgbNqqkcToJhFxoAMjrTuwVnEG7Z0XuyfF30HcyFytlHwTxqndWVUY+zdOHgH8JFViZanGMoVR23SlxbehOPnzCGvufJqT1teVPdgdLircygIh1Ey9FnwnP8+B7yTIcScFE2+Reaovy00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782993943; c=relaxed/simple;
	bh=uPWMq9cV1DRbmfYuy2RpOefsvDQwRIf5lBPq18Iz3CI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=LxVaGueTQjcEzMDlDFyGk8aUhbQN6AHs+Z16BDp94y/iLyb/Qmdl3IZozmTuxj1LVRuSx5URPWD/rizuu0JLjhXLtCvXOqYjMOmbV5RsvT3DL4Dpe9z6JabC6nT8C15/Y436FPxxMloQox3vwSBSwFpcX+lO4JmRt3Grff1Vp30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=usp.br; spf=pass smtp.mailfrom=usp.br; dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b=Mi2SLvLL; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=usp.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=usp.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b="Mi2SLvLL"
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-9690c99c917so642846241.2
        for <nova-gpu@lists.linux.dev>; Thu, 02 Jul 2026 05:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google; t=1782993937; x=1783598737; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rmBb3AiIVPGFeOn7V5UKb1QDdSuVN0QXacb3HjQ+rKU=;
        b=Mi2SLvLLua2nmYhhWE+9vUFCA2zO/X9S6LTpZLxBYY7ZsWCleX14FmiV3McyzvVoC2
         GcBMwyshgyKYPaNqsPL1nXIxlktj48j85aq1CXRw/JCgxghakW1jakTTdNKCF8IqH63J
         25g74qMPK6D9gEBz87jq7pczFyppEzTMhJFDjpQSs4t38Aq6FZlVxC1c/mFI4QcbyUZN
         +uDqY3BzsToAFE1iGnZUtRey+ItNs9lwBYQMlDW4HJwhDnvqOwxSx8ZQjLG2ALIISqF3
         UX13uOvI6FwWbvI2gnpnAPcgsKRSH+r76pdQkjfLJ+E1od5UJzx/b3/shNmuCmMxfaqc
         L+5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782993937; x=1783598737;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rmBb3AiIVPGFeOn7V5UKb1QDdSuVN0QXacb3HjQ+rKU=;
        b=XZCaao+IS+O5loSLFUNIFtix5Y30ZqDcTwjcbyOhxx52HN1UddxK5ZOOHyN3EgdXP0
         bMAsy8bJuwl2HzzrDc8x9DBYJmGBDR933iLjCFTI7JBj3ro4eEjLJ4OlRzicGgyBEYba
         Fw90D2W7UrWuwDwkdF3IDwEjpkWI1dgfQxzcZ8fU5OBDPgG/CQB3Q44Qiz3MODJhlD7h
         l0MAdFC+ISgua6HL8JC+RMnsPrGKAvL226QiWElgjtgDBi5PjzN2m3TSlopj+otVaNjK
         AHWbhqogOchyvAEWzKf2K0KvaYCfyCwuF6jOjLBObccHrbQQX/tjU0N9277+vgaI886j
         o2zA==
X-Forwarded-Encrypted: i=1; AHgh+RrOSqtOJhx0QAK8gLauws2gYEua8DK0SXqsPGM6ReWE34BHoap6DE7zhh4JMJcN3FUvjdLhfxb78g==@lists.linux.dev
X-Gm-Message-State: AOJu0YzssrCdDppkqGwq2U6QUwlrwIzRygnhyGXCAs3Jj5MJjFG6aMhw
	3EUpz4vk/0eqtbRlc/FQEX2IUDRzDEUeTG4eYraXru8UjS3d2LRxU05jKo4H1ISzfYU=
X-Gm-Gg: AfdE7cm6KvaEq4sPE0abvAFkpbqf0ElVp7ZOL5BDhDooy2yhxfxQYU4dZrtz15DFVmw
	BPTPlVFb8zPQUGfFgCc/q+Q7JbNtgKn5Zsy98uUpRmDGGvHrg5Q147Lfc7GqOXbquW+5x5isE6E
	b2YUlJ0DnS/W7ETAAIp4v3NAJsL/32SiI18mPsz/gP1p5tg44bD0/0hSTPcwIVHh5wXG/QrzclK
	g2koSd56HP6w9WMQvQbFsg4Ib8wu4nBObzqJhR8GdbNXDxULWfMMJXAWckSg1WsdN27z1ytLOqS
	cu5t9unXmeNRZKSsBu33jtHytNnawuWSq+JcfoB8NibuLWc2HTkRclGFJNZ26o7dtjlCR3Y1+mS
	oSt6fs849GQMP2FKWmSNdNA5LzG2c1b3A7hH3Z1bqsnBew6yRniA3RrASFpFnWFyEVzMT2BLARw
	6gfJiFTP0M817hmaH9jpNXIpn0Gg==
X-Received: by 2002:a05:6102:54a4:b0:736:e617:b4f7 with SMTP id ada2fe7eead31-73dabb35dd4mr2370159137.21.1782993937394;
        Thu, 02 Jul 2026 05:05:37 -0700 (PDT)
Received: from niyudi-linux.semfio.usp.br (nat.ime.usp.br. [143.107.45.1])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-73e1caf43casm1182470137.11.2026.07.02.05.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 05:05:36 -0700 (PDT)
From: Pedro Yudi Honda <niyudi.honda@usp.br>
X-Google-Original-From: Pedro Yudi Honda
To: dakr@kernel.org,
	acourbot@nvidia.com,
	apopple@nvidia.com
Cc: nico.antinori.7@gmail.com,
	aliceryhl@google.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	nova-gpu@lists.linux.dev,
	Pedro Yudi Honda <niyudi.honda@usp.br>
Subject: [RESEND PATCH v2 0/5] drm/nova: replace `transmute` with `zerocopy`
Date: Thu,  2 Jul 2026 09:03:19 -0300
Message-Id: <20260702120324.40388-1-niyudi.honda@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Pedro Yudi Honda <niyudi.honda@usp.br>


This series follows the introduction of `zerocopy` to rust-next and
replaces `transmute` traits with `zerocopy` traits. These changes are
mechanical and don't alter functionality.

This series is built upon Nicolás' recent patch, and does not touch
gsp bindings.

Specifically, the trait `transmute::FromBytes` is replaced by
`zerocopy::FromBytes` and the trait `transmute::AsBytes` is replaced
by `zerocopy::IntoBytes`. Additional traits such as
`zerocopy::Immutable` and `zerocopy::KnownLayout` are implemented as
necessary.

Resent because of wrong target list and wrong email in "From:".

Pedro Yudi Honda (5):
  drm/nova: use `zerocopy` in firmware.rs
  drm/nova: use `zerocopy` in booter.rs
  drm/nova: use `zerocopy` in fwsec.rs
  drm/nova: use `zerocopy` in bootloader.rs
  drm/nova: use `zerocopy` in riscv.rs

 drivers/gpu/nova-core/firmware.rs             | 10 ++--
 drivers/gpu/nova-core/firmware/booter.rs      | 26 +++-------
 drivers/gpu/nova-core/firmware/fwsec.rs       | 49 +++++--------------
 .../nova-core/firmware/fwsec/bootloader.rs    | 18 ++-----
 drivers/gpu/nova-core/firmware/riscv.rs       | 10 ++--
 5 files changed, 30 insertions(+), 83 deletions(-)

-- 
2.34.1

