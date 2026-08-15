Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A716A30B529
	for <nova-gpu@lists.linux.dev>; Sat, 15 Aug 2026 05:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786770516; cv=none; b=VkMhY8EF7b7IgM8wBHSEoJrzMNWLx5rLIaWpaxrLq85wqEERGFyWTqkbH3LQRn36RicHx7SL2WBg9CUIVBDhxmDkQz8r2LxvpkgSaOP4bPHh5vsPG5Xh0AIREN63Wf86cnBlt41m1MQz7abokv4GxngRxtuXtyO2ZG5BINOZcho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786770516; c=relaxed/simple;
	bh=RNy0Oc1b5YVJpZS5AO65ioCXwPG1K+v8mTvUlX+rTyw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XWyTlluZGw8oZgkI9XD2h89LMP+TA4gLOMGb1SOfWqDxIkcDl40ZuR1fhJy6EZGwlIrpYEibq5j0FEIpPZ1ddlxekHDoHRyTyBAuxS9h96plPe9oiRFk2z6V0ygbWV8Z7hCt3rYtA973yfcZK16cTwHotpqGZDZ5PrHQ9BVCNV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q1KzXWSp; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q1KzXWSp"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5b28c91fba5so1920255e87.1
        for <nova-gpu@lists.linux.dev>; Fri, 14 Aug 2026 22:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786770512; x=1787375312; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NgkFZajAQJmzi//1l9aIpRfIFvgCaKKT8i3Z0CDYaWs=;
        b=q1KzXWSpCtY2ELl42l1RShdNPnUxysbprWBHb3wvRnGy7LcxWikYbO/H9dqmZvg/HP
         MB2FIqLhP57K4pKwjCXAxbLs15MKPklvCtQHI1UxYKG4J1SyoENmaOeNsqv/pyr7dlxl
         p9Byz9LXEcMPYSCG39LLEIMfiHXS8Rrq1pJY/H8t9/hUPQQTVQISL3B08iHCgGqP6pXz
         o5g4ffOMleJjcW7iMtbxKwlDBiWBW9kbq9eVX8+XeEh5E6WAJpaj6uRQgKXYd7QYHRHV
         y8o5bybbXmJUeDrZiypeWfwhRmjdxTFaA5fDMP0IA54TiN0WTPQv1OujTaTz3MqjQ1Lq
         ydbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786770512; x=1787375312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NgkFZajAQJmzi//1l9aIpRfIFvgCaKKT8i3Z0CDYaWs=;
        b=RC6ezEAhL2EtZA5dYRKvOrYgrhmkgHEQupmxQvDRMuo0pLszixD0IuXo+bEqA5jmng
         a6WUSf5fI9GNq6rWiTaEt6/rNh1ahu5mtp0htmeV+O2X1v+jrZFw7fFIaKhGJXAvZB5H
         5NAQsHmAnSERTFyxT2YAhes4ro75W1ogLNLv0ok6OrlN51rBBfXRsVXje5Rubg2E0lQQ
         SwrOmzifhjw7HX7Yq+5A0E7bOessEHfMU2fvJZ3GKkom1hDm6hu+1Wd7h04nZa3kJilW
         mP5ikiBM/O2gRUTZxBgORcXs86CZm0Lm7LXcTr8TB/5C6BDDMmBaXG6fwB9CxB9GWq62
         jioQ==
X-Forwarded-Encrypted: i=1; AHgh+RrtzLhwjuNuPXT6cEPc3ezFM32JaHxQWWikxCDqevLLxNFADT/0vqzGj3BFTZz+q/IjkEeEv0hr1Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YxvZPJGpAPq8iodO+cgHq/W401zhjZ6xNgJQHQZAkqXrsQJ0NmW
	Qg72JiIQ1Y6UqrS//OSJem+7rc3Xy679A9ql01fo5rvA9+j9Y3+3mGg0
X-Gm-Gg: AR+sD10C2M7vv6cnr42x53qy1RWY3U0N/sxo/1QxuZJaALs06XRRq9is2+6KVmcxRV+
	p2/S2NGZqL0z0lHCQTpi7egeuGZOKTZGOE2BtEguCJ72+JGRg9OiFVVdK0Ve+334oja4tfljh7l
	kj5ahEoQh3m9qFEeAXwtqMen7YmffSNTPbIpELNCWBwkh9s50yabplaLwsfYuR31FN8t1JdUs17
	BVNyEP18KiiTTPr2uqtK2n7twDx0TPFBO/2qIKLIhsbSTiDquW6ORg8cGOQM8kOwZD3QqQwXnir
	q3c+x2/isi2FrDXj9es5xrxb62riytxqa6zQPBepez2NYw2JJ0MUY0jq8FfdYEMD62CMmTkDraz
	wJvDb9V7IlRvWeU0EsZdGE1ibVpwOwPXLD46J15gQ3M1KnBTnP0CDT1JDsmSglEL+F1WdfQERy1
	cgEuXUaUKYcBGFISWqoa56VB8i/vjRtgaNJpEpKqfzR+01sal5wTijMwXispbqbfPcQZQ=
X-Received: by 2002:a05:6512:150e:20b0:5ad:68aa:8a78 with SMTP id 2adb3069b0e04-5b453b9adeemr2672003e87.5.1786770511539;
        Fri, 14 Aug 2026 22:08:31 -0700 (PDT)
Received: from localhost ([95.190.110.153])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b458b9a9a7sm932354e87.13.2026.08.14.22.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 22:08:31 -0700 (PDT)
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
Subject: [PATCH v2 2/2] Documentation: nova: remove completed GSP log buffer task
Date: Sat, 15 Aug 2026 12:08:26 +0700
Message-ID: <20260815050826.306717-3-vladazaharova2018@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260815050826.306717-1-vladazaharova2018@gmail.com>
References: <20260815050826.306717-1-vladazaharova2018@gmail.com>
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
index d5130b2b08fb..cae0578d32f1 100644
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

