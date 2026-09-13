Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B5936D9E7
	for <nova-gpu@lists.linux.dev>; Sun, 13 Sep 2026 18:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789324693; cv=none; b=XsBba2IENqU2HYiPbimcmSxiNGAtIgX2PzMs8U32FVM6oaZJ/EAytsSeu3d7PkZwS6SkwTYL7VfQZqRvbYEf0yzAJVqitOmJceIHOSsmqdAhgoFNY1+gDsVMFx6LLwNjdnmW0w0SEvSAQqXmFeKjm/LHK7h7pOKqvUfjeO/VXmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789324693; c=relaxed/simple;
	bh=+cBOmdfMRpo1mKp8ZhzrQDLiYCnzdvGdytXX8AvmtTA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XXMYMtddlVAFp4kJmYGyplhHiHLzw9nlTMr8hKydc+Ia+lA2CIzVIuQtFTKzTKwj3GfI9uQH+Y3HWuIf/4WIe9iJuHEpvJnm8R9eROWoWrZfMKlthFtx6Krk+c8fMBNhzI2GFHwVv9ARZ/wQZGyXbA7GzyyUObbebihcZH7YKZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U0hcaINi; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U0hcaINi"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccd78e6eso370555a91.0
        for <nova-gpu@lists.linux.dev>; Sun, 13 Sep 2026 11:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789324691; x=1789929491; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f8egR4dMbs0feNIgyGf2N4bg3BFUD4E92PNKo+p8ClY=;
        b=U0hcaINi5Xg8fQ83/Mzz0FJ8xxcMhhNiv2lIu3TMdNsfltetrYUt2lDSNZ3D6H0L7x
         70bKSow6cj/0u8Cm9IzWSW4zyqt4gN7Q3nvQunffJtpa9xlNpDNmPHPJF6cCNj2WR+TM
         rmpjCM0sEoGjJ6XW1N4eORsEaj25hHAbniid0QEwpyV4rYmKPjZroGjOKpalZErBpiqu
         nIaBDvVIx/TwAcwSyzg1h9lxbtF6t1/FrIEBLPOAAsZ7BRw9alk+S3oeB8h8FYGc18tp
         Zj9MasyYYYxYUswz2jGfpjjTkQ06YnhRvV861gLpTHJQkL6xBfvW/LDS2Bz4egD9YzbM
         Gymw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789324691; x=1789929491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f8egR4dMbs0feNIgyGf2N4bg3BFUD4E92PNKo+p8ClY=;
        b=i1n1P6bxffugOo+7LZSDcC7qTypFjs0KpGA+Lb3uuGgw0VX/5b8HOlP9s12kh+vFMY
         yXWZH9yjaq0/9qQ9CBWMh7lYW1ILgmlaAVsoYT10the5wadIarUrqCF1Bj3mxT6EdNsm
         6Sn5wx5yppA70RY+smqF2tZ4jbtUMnYSQUuWe5IkLxietRBYeXcvWOuYB9PHMGZ2KJAH
         B5jPZ5mzLeUXyj5D6BWJlOocp8eTe09aQxwnVB8MRS1VYzczLeZf4KFwoM7zzVg16Dj6
         jkLkIR3bR539FaJSd0wD02Lzx3V+Idg+Du6xgrK1/OiEGN5PT01O1wkXaDYMLx4+qMMA
         hP3Q==
X-Forwarded-Encrypted: i=1; AKwUvBwwQo9wq74AZNmjkGRMFPijABIdUQxWNWl9Vvcu2t/Yjd4hx1ggyYWoK9OrlOuOpOP4gUWP6skiWA==@lists.linux.dev
X-Gm-Message-State: AFuF++mGBw4PQ7n2xxbBTG/j4K1RAzaccDDaA7YEGBjsRPKFLyUhMHrl
	BV8UWvSXSikL3eoOysjb4kGiRi2DG3CtnaA+FezIph4q3pzjGBXJdmCB
X-Gm-Gg: AYBFou3d274hcr1AS7D8AZSWwg9ekfw+gsLPAogkWslNr8XzUieigM3940KR1X630/X
	ObzkZP3SCNkrDUTJt+lDoiNwtvNp0LWk7XuiVMwwYzW7k30gw8k4SCLy9bjN/uLgCvosYgEa+4y
	rogS9DyNirn7Lxr32VxS8gB/otWXkpzTLMCAQoR3wJwaDMz1D0ZQ8c8wA87JOsre29KbdZ9lFOA
	iiRYa+p8x+x0kofvmntX61ohVlaASpZ7s2M6u8R4yMvy15LwH5NFkqFcy2YY+QG1iQehhS+VOEN
	rYrbd/HSTD0gnYxVW1e3/xD/UJHPg6w5tDG3b8NZBynk7THOuQdg60hy1zZTBIqjAw/SVaHV5Ic
	DP5wV0fVd80F+ESTkIDP3zEmYtGfkRClgAPn4fFiSwRE3pEiH3Ccm5qwdYSHSmwwr0/t1uaPwRC
	6TMchkRdYbDzhgqug3M2Jo1qSR9eJntYkYbqGn5ezWnRP8zUDrQwZg0nBNPI/gCsN6IK4ynsdD7
	9F+qGMf09LECCuSFQ==
X-Received: by 2002:a17:90b:50cf:b0:38e:c232:9d2c with SMTP id 98e67ed59e1d1-39dd54d7dd3mr3783446a91.2.1789324690644;
        Sun, 13 Sep 2026 11:38:10 -0700 (PDT)
Received: from localhost ([95.190.112.239])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d9b08165fsm4118447a91.1.2026.09.13.11.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 11:38:10 -0700 (PDT)
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
Subject: [PATCH v4 3/3] Documentation: nova: remove completed GSP log buffer task
Date: Mon, 14 Sep 2026 01:37:34 +0700
Message-ID: <20260913183734.134307-4-vladazaharova2018@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260913183734.134307-1-vladazaharova2018@gmail.com>
References: <20260913183734.134307-1-vladazaharova2018@gmail.com>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Exposing the GSP-RM log buffers through debugfs is implemented, and with
the gsp_keep_logs module parameter they now also survive a failed probe,
which was the part of the task that was still missing.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Vladislav Zaharov <vladazaharova2018@gmail.com>
---
 Documentation/gpu/nova/core/todo.rst | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/Documentation/gpu/nova/core/todo.rst b/Documentation/gpu/nova/core/todo.rst
index a01c362b1be0..28fc7329d56b 100644
--- a/Documentation/gpu/nova/core/todo.rst
+++ b/Documentation/gpu/nova/core/todo.rst
@@ -141,18 +141,6 @@ Implement support for instmem (bar2) used to store page tables.
 GPU System Processor (GSP)
 ==========================
 
-Export GSP log buffers
-----------------------
-
-Recent patches from Timur Tabi [1] added support to expose GSP-RM log buffers
-(even after failure to probe the driver) through debugfs.
-
-This is also an interesting feature for nova-core, especially in the early days.
-
-| Link: https://lore.kernel.org/nouveau/20241030202952.694055-2-ttabi@nvidia.com/ [1]
-| Reference: Debugfs abstractions
-| Complexity: Intermediate
-
 GSP firmware abstraction
 ------------------------
 
-- 
2.55.0

