Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D766936C9F4
	for <nova-gpu@lists.linux.dev>; Thu, 25 Jun 2026 20:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782420774; cv=none; b=T7Ymhc6j9jUf2JYf+g3BFKWoTAAssTYIFSyR4uuPKTaXYqYS8lUj/brSx1v77ALmSEH2BuFXgNcAz9Op3qJDdRS1eDUmDsqxq6WRcOAC0w+DqzqVVT47PuOyOUWl7CiatO4VPwLo1OkoP4xp3Ov6TsZYeyT2ic5vMMHT6Svg/fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782420774; c=relaxed/simple;
	bh=D32koSWvgoGvKS8jYYXh314Q9RalPXe3O5ZeUWipDO0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BOXeva4X5LTXvJvBhAdFhdqw7f2zpWbh7t0IKacBQbSLnMS1yIwrZ8b8KqfQfZ7D7VHtgNIveoTb/P4Vm+vwy4B5E9dZ2J0zh4nnZwmySvWqe6k619lsPyigwSFUhGsgEpn8smL8ZcbcyC9qZqAfoq/OkgcLL5lkpTqTy8fYSCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=usp.br; spf=pass smtp.mailfrom=usp.br; dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b=JgijWInQ; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=usp.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=usp.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b="JgijWInQ"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-30b6dad2382so697712eec.0
        for <nova-gpu@lists.linux.dev>; Thu, 25 Jun 2026 13:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google; t=1782420772; x=1783025572; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=90Bh++27PWYhH7a1Hqb3PFYlIq7kRvjS/VwtSAfZ+kU=;
        b=JgijWInQKz8rduj0Ty+JToILppzA3VNCnqiYDgxh6d3Sl4ArJH4bFgmdvFokLJEnMz
         swyGzvuHD1nEdw8qG4CIf2MwjDlTMOqpTZ9Q13qIQqXyOD2Pn3BsnIy0xJa/OC326Vw2
         b8GvaV21xdduPcYJ4cNkawFPUFNLFbst1QCNjKZoO+xVVsT8U+LAa4eH1811JNXzNUgi
         YaLk9l6vOVpXfjdYwZt1+5i+YqxoQwnBeR8clJwCQ/mLX2AGdBnAC4bqZD52DifFr97f
         snJM7L/IZTNljBG7WwFiHTwMgJbU93buu0u56y+LsanaLS6JypwRr/D4OCfahJwPVo0g
         Uc0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782420772; x=1783025572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=90Bh++27PWYhH7a1Hqb3PFYlIq7kRvjS/VwtSAfZ+kU=;
        b=lwK/HSq/75J98D5QcK7cUftJMV4IbYgpLet6GDsdKK9Qzyhtxeuyj6egXSQgNWUHAi
         huQBKjgv7LOO8jl4pAPeMsl9obMAo3TF/weeJMWQbtd7j+dsNZzU9FOweAeVoyAvJX1J
         bQZ1rbBGOH9nMRZP0oLV6FHKSgJmFyTk3z/5erP2iwZ0J+Sua4eViYNSeIB9X4yYk1YB
         J/nOz/6vYEv7FEIjRmsAkHJUXY1Z/Mnk6xzqFM/ASw4+3TvSAQzi4T0UeHsnC1gs2O+U
         jjvImjMkTYkIUe/KBT3tpAAdj1IBtsM2Ojixij0+tHekEOce6codVtnokGq+7FVr+Sxk
         4YJQ==
X-Forwarded-Encrypted: i=1; AHgh+RrRM0vJ1L3tSX/JDm3Ekcs+kUpwGMA+46f/nkQGm9Cb4H7FuO8Bo7pPy2hJIRTUDSBop2fEMoXW4w==@lists.linux.dev
X-Gm-Message-State: AOJu0YxZ6mhnnhzcXc77N3pV2OBtFRKrCUYOuDpyFxHUjJaecwZqsCm0
	5Nqt9WEn15mMtljpJppPPZZ9weQ4IJEYnpqBQXQQFPm7Mwfk24f7xrI5SkDC4D5ndW8=
X-Gm-Gg: AfdE7ckyRedaO7jC9U0z5Pd6VZDENTp9ZJDBZfYpwx5G2Bu5VPVIXbr0ZxpnWP9uJlu
	iukiswYFG9+2/nalc20NgZOlUgQJve7vz9g1HkSpHC2+fVJeawXcqqa9MfeGMqXrjH9kQtu1Fia
	Arrq6B5CdN9lKx3ce9pBaEZbhPomEJO+DlYyCCjVO5oSoU84ovzV46tnTMdWpSIh/mEMaHyY+IU
	Wu68NoXKChboZAzHKP2F1LulfBq4068R0ln1tHZOCH74W7sY2zlKCUqU4hn2UnHD4WUq6hVgVcX
	wLStSDQwJVKIeOuXT+qzkTeKdoPSGY34D4XN/FhpYcBzxcnYt/J1pWDO0P7u31hMfqnrTMgNcf3
	bGir4xSeKAeZVV+js3wTMidi92XxqzZjpR+1ddKqoOtrqCut8hGm2/4x+kHJmK106a4/dzooY6b
	XWp3wDHOaQixzOWnqtnHgwvshCAw==
X-Received: by 2002:a05:7301:9c95:b0:304:e587:5063 with SMTP id 5a478bee46e88-30c84b6f548mr4769384eec.12.1782420771923;
        Thu, 25 Jun 2026 13:52:51 -0700 (PDT)
Received: from niyudi-linux.. (179-242-249-142.3g.claro.net.br. [179.242.249.142])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c4c691dsm10981525eec.5.2026.06.25.13.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 13:52:51 -0700 (PDT)
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
Subject: [PATCH 7/7] drm/nova: remove unused trait in commands.rs
Date: Thu, 25 Jun 2026 17:51:46 -0300
Message-Id: <20260625205146.5047-8-niyudi.honda@usp.br>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260625205146.5047-1-niyudi.honda@usp.br>
References: <20260625205146.5047-1-niyudi.honda@usp.br>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pedro Yudi Honda <niyudi.honda@usp.br>

In gsp/commands.rs, remove unused `transmute::FromBytes` implementation.

Signed-off-by: Pedro Yudi Honda <niyudi.honda@usp.br>
---
 drivers/gpu/nova-core/gsp/commands.rs | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index f84de9f4f045..a3c0b7fa3b9e 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -12,10 +12,7 @@
     device,
     pci,
     prelude::*,
-    transmute::{
-        AsBytes,
-        FromBytes, //
-    }, //
+    transmute::AsBytes//
 };
 
 use crate::{
@@ -149,10 +146,6 @@ fn init_variable_payload(
 /// Message type for GSP initialization done notification.
 struct GspInitDone;
 
-// SAFETY: `GspInitDone` is a zero-sized type with no bytes, therefore it
-// trivially has no uninitialized bytes.
-unsafe impl FromBytes for GspInitDone {}
-
 impl MessageFromGsp for GspInitDone {
     const FUNCTION: MsgFunction = MsgFunction::GspInitDone;
     type InitError = Infallible;
-- 
2.34.1

