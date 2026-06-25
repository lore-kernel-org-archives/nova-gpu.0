Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31BFA23ED60
	for <nova-gpu@lists.linux.dev>; Thu, 25 Jun 2026 19:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782414391; cv=none; b=X6f1uRzH9XV+BEAedTi0Hr4vsdwujJQlxxrROKHM6GgxvwVN0Hx5zh4I39aUcepk1oOqcEhXIIVpOVA07t7A7UD1vh6zeHUtHQTbU1dLE2/Yx2KvjjvOiF7aISJA57H+64t92fhptqFPTWa5diXYcaAtEaSKnHlLyRs5/3HIyV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782414391; c=relaxed/simple;
	bh=D32koSWvgoGvKS8jYYXh314Q9RalPXe3O5ZeUWipDO0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VelMQFUakz4UfR+J/Dc2qyioraVS6lZY9LSnTtGFGpup3EqNf2ObL5LclyRBVV6qwT8g3bfMPUAXUNVWGkuFYtVm0GhnYtaLBlfoSHQBlBbmRr8FS6YNQfrY8pW8XCrBiDWUEk03fVZeVLQZMAG7QsMnxpzAk2FqcU+C5FtqrLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=usp.br; spf=pass smtp.mailfrom=usp.br; dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b=IClPjaPc; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=usp.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=usp.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b="IClPjaPc"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-13986d61b4eso510921c88.0
        for <nova-gpu@lists.linux.dev>; Thu, 25 Jun 2026 12:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google; t=1782414389; x=1783019189; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=90Bh++27PWYhH7a1Hqb3PFYlIq7kRvjS/VwtSAfZ+kU=;
        b=IClPjaPcPBjKtelEXGNQq3MtJPh+u1HL5XNhmMx1GizP1D9kLhMPlq3L5p7GjJpA5A
         LGoekzFl1rAeQsZJpueHzEYxzIsDEWT+o4rfTmQs0XtjiK2I+iEBAfTA8t4xtK58aymy
         lb5NVHyjLy++IGN7MiSdWnM+LFjCXKlBarr+wxTzLh2dzb8NLd81JJfEgceV0thWqF43
         7CTOz2vAkemUC0+rvMFsC27gx6RLQGY7O5dc10bhmv/NGUXP4DXHsUDTjSOsDolpodqj
         hvgIg+AuY8JkcbLk+1V5luGAQT4lWI7uZ591O7mZvZ0IP/E3Qdf49xxf3mW9JB+UwTsB
         kTwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782414389; x=1783019189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=90Bh++27PWYhH7a1Hqb3PFYlIq7kRvjS/VwtSAfZ+kU=;
        b=lrRXY8Dg+bienKCpPw4eu5bokePLonO6dC/ncrX0EDEsateG+3iV2Yw34yx4GLijH2
         pB0m0YxHx4ztsWjiN7vnPEgD9zPI+rkMwhxeZWAPkYN9wPSC329ufTjtO4stpaEej6ub
         2/CwJ1D+5GpZVqIRwQFhO/eGLsgrvJ0j4J16jJNJ8JXhwb2G3BrQyUhQGk5MJ2ftcqZ6
         Rf2fxlNnvQqcysNk2PtzxpNO/Pm1IRuTcPP7m/Wsn2GqlSu0JWDugtM/6CXQU5qda1Tm
         M8Bs4sD8XphaXzHFuGMThFDbC6Dqkn+hCxkEW/2VHO9V7tZAWhlf2IOd7l+HYM9sFX60
         IQ6Q==
X-Forwarded-Encrypted: i=1; AFNElJ9k0vYjOLJ9O8hGR8IM/lG+MKSXF7eICUwYbjSFFDC6j3Y1r3RGnKeZIJr02KvCa1c0BxIVBgGYvg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwUigpSrEExNbay+ktxBasiGP4Clp42KXCtshAn9suuUwqvPg+D
	HgZHf4gG0vELM1Crsp1W8ACuEC3PFMZ2GfhiT9sjbLNplfPWTBdBRDzBDEMGgup+4XA=
X-Gm-Gg: AfdE7ckyOhMUID4eFRJEF5JIimzk53hK6JParz7KXz65JVtL1vrXE49EIZTEgvZ2Ec6
	QTda65X+XonzLdzwZ2dOIjU8vyUIShi+HwzbNtbuL2jILbHSKGqNWMvJdMf9GsoyzAtf/VP4hwT
	1aLGWZXvNYfZe2J/bG7h7OCKEyX7u7D6tc1vjE0WDK5Nvco2ZGfav2DS2BNoWyJmSr4RdeB5A2B
	o8Q90QzsBN8r2aGXnQxG21ctwq8ZDsm6M3Ao676iD5CUIC22AQU9HFYiWYIW7beteT5H6O3w4pj
	qTUUHdS4LWanPbrMRniW5nuJGv2is+LrvmrTY44WayKG1gdYrcf5iltzfkDozk/isTyBJ1PZDQN
	W6WARCMKhgkejmdR2uT6W/dNUePY735OE00raja3AqAlJrT959tice/s7MPU9a/a/N50QtCDSfs
	+ROXF+fHTmjt/NP3U=
X-Received: by 2002:a05:7022:207:b0:137:9ab:2cb8 with SMTP id a92af1059eb24-139dbb3ecbbmr3240694c88.21.1782414389053;
        Thu, 25 Jun 2026 12:06:29 -0700 (PDT)
Received: from niyudi-linux.semfio.usp.br (nat.ime.usp.br. [143.107.45.1])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139d8f6acf9sm10742999c88.6.2026.06.25.12.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 12:06:28 -0700 (PDT)
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
Subject: [PATCH 7/7] drm/nova: remove unused trait in commands.rs
Date: Thu, 25 Jun 2026 16:05:53 -0300
Message-Id: <20260625190553.7245-8-niyudi.honda@usp.br>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260625190553.7245-1-niyudi.honda@usp.br>
References: <20260625190553.7245-1-niyudi.honda@usp.br>
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

