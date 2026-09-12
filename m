Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE653F077C
	for <nova-gpu@lists.linux.dev>; Sat, 12 Sep 2026 07:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789197530; cv=none; b=kK0piDgzIUrGUstsY/skc4wjxMWqvgmnoA5FCcuwPv0lT6Upz8IU531CLOFIxneq7cMxuXIb95x/cXHoaoyOvBwo/tHkiMwa6WnVwaEpuogjXX0JmLKymeT3FxGYwOc9Gi+wNvkmqmOqVMoSHVSB4nuqhKyp7F+KMGsIf27tnP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789197530; c=relaxed/simple;
	bh=icmX+e8eV5T7lwdK+/Ae7/ixgFSBDIOa2J3Wav1g/+A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SmPpMoBjhMKcL83NwH41W3Z23j6AXv31iSWxRMOeut3v61jzHWBjW8BgCr2/0VEvacne8BjovffO64AaLXpFZsi9OIPrlahR/dnHvS5GBMU0zblgYcbcy4pEMHyDPl478fJ3fyW7bayK9lOQT14VETlmtAJSp+wC7OjReGennu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CxFRtyMi; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CxFRtyMi"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5b5e5ab03afso1608276e87.3
        for <nova-gpu@lists.linux.dev>; Sat, 12 Sep 2026 00:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789197526; x=1789802326; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=57Wx5MSpf2ecnCSxZA6V8UzQ9jEpIiGdt0LOaHjR6Qk=;
        b=CxFRtyMin62VBOiuhEYz4ftAhCrdC3tMNfXDhCIShAWd/fh21QzBfB9HUWdaqCmInA
         n9WTAJ4TQM9hBV/0JHj1ifgaVMUpbzNGtLbCcILJxZVszI+2qYEgvfpZ0V5C0nnN+ity
         6COnFMv2ltFEvjdTXU5BnzBW3oWjmllq7Kz/fYDPLXLcyaN+lSS5JEu53qLP6bbI0oQD
         1xnKpTIPiD7BYetVDbeIG7lHOm+tz4Wd9HqPNcqzsQ+iOQpeYBH0tJM59kXiH9FMPbjG
         6zr73IYQ1lMmUJFrwq4QWpdeGuaU45qtdzXbUdOw2TYQPG4XQMvJfWwkbiv0QfZuWJz1
         SANQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789197526; x=1789802326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=57Wx5MSpf2ecnCSxZA6V8UzQ9jEpIiGdt0LOaHjR6Qk=;
        b=h0waTCpwoHFuGPMfP7E8SXsJjps0vtuY+XIgJG0N9NBAOpL97YZ68Hl6hSeoIHvE+9
         NXuzTjt4Thls+Vy4fM66LcZ9Qr741MQCCgwJUel1+4MjQjj8u/gevPMS/PzsHeCkQF5n
         ICNfM1G9fFYWzXp0z3kwhe6eKnNx6OX6fvlwLH36LWyyhXqHL2vxegWDk6fslETzGDC6
         LWLJYj/gryDZ0lax6nxQsxzVNalySol9vSLLCQaMZ/DOExAz4luLy3bUMqWGW0HLr+yS
         c5PnoTEfJnP9mxoqrb9EcZmQMxcfFgUXaql283T6c4JTl6+ZnChi4zKe6PR/UIoRcvj/
         ii2w==
X-Forwarded-Encrypted: i=1; AKwUvBwvw9cfxS5WzzFapA+wzIgZbcuub+yPkYFSnfYBcBHi6LYYaBPKBDsnBSegiIpR/1Oxhq/C3CihzA==@lists.linux.dev
X-Gm-Message-State: AFuF++lnKxkIe/r5BmxWaAr51zciQYtKVa1g6UbEP5BBCjy5NqgH4YC/
	IXg64xG8MDwZWTA3j2bSBcgvbpPMo6D/quWYHzIELJ469oj/SHIaPcgE
X-Gm-Gg: AYBFou0bWFRDqcSnqfZaw1auu5RJQ6QTujV2qX4J9rCrPuLZgUyUcfr4SuVrh3PttCa
	IZWLUOFbmPXbYpJJ+Jswv/cNQc6zES1vlfn1odbxHfYFZiIXS40oAT3VipXP2Yi7zLXJ4dgKtay
	e9LMAfSXoFev6PXw6ecUkGitvxKSjxqNxisca6sUOIPiJ9BU/CF+i0wb/974JyvrcsqYzs4Pc9F
	YHNNqKhBOLGoXEDhThgwBFirmed3rG9wV45wOANrBBcNTkD8L30EjfVOzuGLSkTiK875abiFGNB
	BIczkz12ECswOHIsL2RNYNx04LV5Xx7uf/2G14tnsyuFAiOGNI/Vl0LiiDe4MPhFCdcaYxqR+id
	AnDScKEh6SFqS3Zg+aysSWRSMF2sQ3VFwlRuAxITRwOh2IcvTHBtf1Kl1C3Ro83YJLqjsLCKhe2
	1pGherVAu1L/koF/tVpWniz1bkH51jd/0hDfJQQWGOezUEAOpSxG6OVsN/lYU9lbu7IvP1JUa2y
	QfN9A==
X-Received: by 2002:a05:6512:2246:b0:5ae:b7ca:33ec with SMTP id 2adb3069b0e04-5b8a02de7eamr1453366e87.9.1789197526260;
        Sat, 12 Sep 2026 00:18:46 -0700 (PDT)
Received: from localhost ([95.190.112.239])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a04571b0sm1096277e87.13.2026.09.12.00.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 00:18:45 -0700 (PDT)
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
Subject: [PATCH v3 1/3] gpu: nova-core: build the debugfs guard before registering the driver
Date: Sat, 12 Sep 2026 14:18:40 +0700
Message-ID: <20260912071842.622696-2-vladazaharova2018@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260912071842.622696-1-vladazaharova2018@gmail.com>
References: <20260912071842.622696-1-vladazaharova2018@gmail.com>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

init() creates the debugfs root, hands it to a static, and leaves it to
DebugfsRootGuard to clear that static once the module goes away.

try_pin_init! builds fields in the order they are written, and an
initializer that fails drops only what it has already built. The guard
is written after the Registration, so a registration that fails leaves
it unbuilt and its drop never runs. Statics are not dropped either, and
the module is unloaded right after, so the "nova-core" directory outlives
everything that could remove it.

The next load then finds the name taken: debugfs_create_dir() returns
-EEXIST, which Entry keeps as it would any other pointer, and every
debugfs file of the driver silently fails to appear until the machine is
rebooted.

Build the guard first. Drops still run in declaration order, so the
driver is still unregistered before the guard clears the static.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Vladislav Zaharov <vladazaharova2018@gmail.com>
---
 drivers/gpu/nova-core/nova_core.rs | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index 1133c6ce5c55..11fe1d2858a9 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -47,7 +47,8 @@ fn drop(&mut self) {
 #[pin_data]
 struct NovaCoreModule {
     // Fields are dropped in declaration order, so `_driver` is dropped first,
-    // then `_debugfs_guard` clears `DEBUGFS_ROOT`.
+    // then `_debugfs_guard` clears `DEBUGFS_ROOT`. They are initialized the
+    // other way round, see `init()`.
     #[pin]
     _driver: Registration<pci::Adapter<driver::NovaCoreDriver>>,
     _debugfs_guard: DebugfsRootGuard,
@@ -61,9 +62,14 @@ fn init(module: &'static kernel::ThisModule) -> impl PinInit<Self, Error> {
         // cannot be any concurrent access to `DEBUGFS_ROOT`.
         unsafe { DEBUGFS_ROOT = Some(dir) };
 
+        // Fields are initialized in the order written here, and an initializer that fails drops
+        // what it has already built, so the guard goes first: should registration fail, its drop
+        // still takes `DEBUGFS_ROOT` down with it. Nothing would otherwise, as statics are never
+        // dropped and the module is unloaded right away, leaving a directory behind that the
+        // next load cannot create again.
         try_pin_init!(Self {
-            _driver <- Registration::new(MODULE_NAME, module),
             _debugfs_guard: DebugfsRootGuard,
+            _driver <- Registration::new(MODULE_NAME, module),
         })
     }
 }
-- 
2.55.0

