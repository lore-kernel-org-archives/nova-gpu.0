Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122CA37205D
	for <nova-gpu@lists.linux.dev>; Sun, 27 Sep 2026 12:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790511365; cv=none; b=LOdemE2X3tzu1fJgvJZdYbInJOb+Qv52F7je8i9ex8zUhMs/FIj+gZnUff8/YZ1DsyOmoahUalor7AIyVLHKHZqDb5yhWB86Zd4b8mpiUxH0BW7rmTEjbZ+13eL9BtStyjUuRmI8c9vQd9CyEaLqWX84WCam9ryl0m+8UJMFCl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790511365; c=relaxed/simple;
	bh=YiVImix9Fj9LKxf/XXbJg6XTJmFvlXZlcouCP/QEvns=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oc2RNO2jflnuwoTOFjuoNRgh403iCXL0t6YSn0uPhByNRpgA/FrJr+fanmuIE+VPZpxiwiOxKjkoGq/W+8tHpYJQ3fONAXRjXFsX0L/bV6tfPaofeAyHET/703kgFuHqcWYE7ohrltvYtLy/ncaBZx9jso9A0t/yiZVtsrO8vv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mg+P2rBt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mg+P2rBt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 676B61F000FF;
	Sun, 27 Sep 2026 12:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790511363;
	bh=Egx/r2gOYtChgcJUWi8op+GbxM8/87DDt7EOAO4/m3Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mg+P2rBt/lg5K6tdnb3vhDLw4RKPjDO9Y/atPRaQAS9/o+tNqC7T+3Z3Gje3Jet4p
	 TEvhMU7nNMMVyC0wlvcucQ0UsOAakRnEi9OFXufld3o6Yv2LKHETjT2O2oXQTvMleC
	 c5UjVwp1xZEDbxUV3PRCcUCGyHJIV+QG940J0jH56wiIrcjBmjpK201XVLdPjsD8cT
	 NSlYTs2mRH4E8sU8KeuBmEujkeTVgYBZuZSoX0m+ATnCkfXr3Fdke7agPW/Kif1Jrp
	 ihsz/IT/J/V1et9xL5si7YUMtZeqDBirT6Oku2AHgvNMLwPEMoFYQhKbACW6vi9p/F
	 aFTAMt97KV32A==
From: Danilo Krummrich <dakr@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: acourbot@nvidia.com,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 0/4] nova-core: align Bar0/Bar1 and remvove unnecessary Arc
Date: Sun, 27 Sep 2026 14:15:59 +0200
Message-ID: <20260927121559.1184691-1-dakr@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260926124405.604707-1-dakr@kernel.org>
References: <20260926124405.604707-1-dakr@kernel.org>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sat, 26 Sep 2026 14:43:23 +0200, Danilo Krummrich wrote:
> [PATCH 0/4] nova-core: align Bar0/Bar1 and remvove unnecessary Arc

Applied, thanks!

  Branch: drm-rust-next
  Tree:   https://gitlab.freedesktop.org/drm/rust/kernel.git

[1/4] gpu: nova-core: align Bar1 alias with Bar0
      commit: c0c5d21b466c
[2/4] gpu: nova-core: remove unnecessary Arc around BarUser
      commit: 224618807575
[3/4] gpu: nova-core: mm: get rid of Arc<BarUser> in BarUserAccess
      commit: 05e647ea4069

      [ Update stale comment in run_self_test(). - Danilo ]

[4/4] gpu: nova-core: mm: fix lifetime name in BarUser
      commit: bf91bd56fc46

The patches will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patches are queued up for the upcoming merge window for the next major
kernel release.
