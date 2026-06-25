Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C8E527B340
	for <nova-gpu@lists.linux.dev>; Thu, 25 Jun 2026 20:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782420744; cv=none; b=TKQs6hAGJXRFb7s25cYfi9iGiXJs1uEdvi5meHVXNgrCg8CzvYJzfFVlF/c2P0o9wSlhnESq+LvV3hezV1yieGGgAUW3UoJ4Z88rl8+lx77rNme8rN3ccQKw2TBb0hOVkgy4edR3OP5KxADIgshu/W3CswPeGDO0j8jp7CdZ/SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782420744; c=relaxed/simple;
	bh=4eGTOJouLCjXQq5nAUTm3nn6eAB8ZLfoiC2TTPgqwOQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tyWdNFmFGwhgUGU+sw7rRj4yIiP2iTlKJVh5cv2Hz5RUYzBuC5fnvXtSRuPI3Br9VEMjN8dzpqTcJt4tobb0Hd2vAT1yN5EFVkqBptC87JM7HmxDtgFMNxEleV2s/TfIBtKMiOBDfunmeQl1W3nNecRsVLW09GX++LYdCACnSQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=usp.br; spf=pass smtp.mailfrom=usp.br; dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b=JazUAc4y; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=usp.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=usp.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b="JazUAc4y"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-30c965eab27so863149eec.0
        for <nova-gpu@lists.linux.dev>; Thu, 25 Jun 2026 13:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google; t=1782420740; x=1783025540; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OruPioe6tbdNpycRDGam1892gPF8sbvYnG0WqG8AtiQ=;
        b=JazUAc4yat3JDM6N4q42ntjsCS7OSHksLj/Ug7tpm8glMp96pZX3+MUR5ina+AtTxE
         JyEPJRCjdqt2z27l9eGAKlRpSJUl8FvdC+h5HF3n9N0HStG6erGznhNifgrY3Nk3SjJn
         TIqXqEfBdpkjmxZ2LgpBeZ/D4iYEVw93qTREWFHAJUvYGj9qpv6rSk9xliFSpwg5VtZU
         9/XFb6UZAJNIuQU8jrfp4thzosbJc2/ZPx8LX9e5bqwyGz71G8UOzaBdr8BQO62fDkk2
         uQI2R2SZfdvRWdbNM571+6egP6L+o12jPD7dkwCLBcLQcEzmgrin7PUqYKyofh5QsU8h
         jFwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782420740; x=1783025540;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OruPioe6tbdNpycRDGam1892gPF8sbvYnG0WqG8AtiQ=;
        b=EPm218CIqfGQBEU7HnuVJskjW520Rkk3Yv4WTvxpxhZf4JqbHWikXcsmORZoDch2jf
         R2bFOaV3AYmagJ1+GWcum1R3kN74/+Dyaaxge6fv6EtXrAnS+kLOtgJPUIQ19nzPvtBF
         zKLkNoKtkZmm9EpuTJEuK6g580v4asOTRhNJkECvB5rBXaAt7r2Cas1Z3bRVxkzXLYRD
         vU7f7f6JYdkbKQqav5ay8QK5qyXRspiGwEw0PbCWbksQauV0Z5YFd1ipIfohteBtrq4M
         KNq83prAoeJD7ktgeAQrW8Cm5zZhlj4p96dCT2ZOF+9K4YeR/rUxwSECDyLFuYVx9dPB
         8ekA==
X-Forwarded-Encrypted: i=1; AHgh+Rqo4peL46y7GB2WfFSC+rDX/BbSNCQjGd9hBbsB39uZaJG/U9pcd/2GYf2MHp5B548MfkoEGy62AA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyry++vP4zRfN7kkCfEJXZVxAUkKS+wTzmVZ4golQt+FPe2CbsF
	6OXaCypAG+Hw/PCHUHtaJRD/1CylMG2gAfVPlEWNuNpx7OWXQ+XH6eW/3Zm0Qgg3YG4=
X-Gm-Gg: AfdE7ckV5AuZvkISlzcMLjRwaY6aiffntk+FsAXGxCYezFozJY1+ENpr7Ca1z24vnQG
	T0EAMugPkgLfCcfkKUdCSrfyuYf+TNTNl0tw40iYK5WthlWM3vcKgHw2coRPc8Jm+8SOHcPzFs3
	TzKIBBQRykrCZ7+tc/IbSgl32/9e7xFBJ7QYFWlVMprF6c/Rgm2cn0+IAlHDRxTPZSLYX5E+sYc
	FTa7WCumYoSFTYEbmRqNt3iIzBW5aTSBNivdGkYTu2+p5FKPnHW922k34AL6QgbZmpEzuSygKwY
	W6RYNtOPFEjpxASAeuwpH56+7afHsaAwjb1DjR/L+VAU7Oox6Bn9AbN94oNKyBrdXpSaT3GbuX6
	fc1Vn8i8E7O4/vyRh4PoJx2Qo37L7uakAEadVlx5I+Pw3WzzQW5Bwwjo9yuvy0s2G3CdPNzi+bs
	CoDU4rTwWSYPA7PJHjN9VUGld2GQ==
X-Received: by 2002:a05:7300:cb83:b0:30c:d60:a879 with SMTP id 5a478bee46e88-30c84eea4a0mr4233861eec.35.1782420740087;
        Thu, 25 Jun 2026 13:52:20 -0700 (PDT)
Received: from niyudi-linux.. (179-242-249-142.3g.claro.net.br. [179.242.249.142])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c4c691dsm10981525eec.5.2026.06.25.13.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 13:52:19 -0700 (PDT)
From: Pedro Yudi Honda <niyudi.honda@usp.br>
X-Google-Original-From: Pedro Yudi Honda
To: dakr@kernel.org,
	acourbot@nvidia.com,
	nova-gpu@lists.linux.dev
Cc: aliceryhl@google.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	Pedro Yudi Honda <niyudi.honda@usp.br>
Subject: [RESEND PATCH 0/7] drm/nova: replace `transmute` with `zerocopy`
Date: Thu, 25 Jun 2026 17:51:39 -0300
Message-Id: <20260625205146.5047-1-niyudi.honda@usp.br>
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

Resent due to incorrect maintainer email address in previous submission.

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

