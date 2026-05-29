Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62FC5305667;
	Fri, 29 May 2026 00:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780014079; cv=none; b=sk/1v3aXuzoQfLt6cHPb3rFwR+4A4iKg9U+gDkYIoPFSvi9NaftTwfpF/4HOuuIQww+R4o+xf6LxKUc1fjYFd9Fa43vhT4umBXRcAJnXe+8dcuLURrfbYiwiRpaOUWiqm4p+qkXM25MsxFH9GdcIv6O4bpNOL/oeDqRMsVSMMtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780014079; c=relaxed/simple;
	bh=QfBOxYSyrizVn6sUCR/aJq53UMPv2DrYAnMRI57ppgM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kUxvk8q+JIujIblP8/ooYSynzM42ckr2ctFcNL1T3CF7sg0FXidKai3Gni4+VXK9LV5tJJzGJFQqJal01P8RKJ2ilUxhc5KJYtZyDJRLtoImkJyO5Jd/b1bLfqZnseJC022jjmY8/1tlGR/dItK4pZWr3bVwFo+4txWuJWzCLrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m5fD351W; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m5fD351W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5AF31F000E9;
	Fri, 29 May 2026 00:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780014078;
	bh=Z0qTRr3KqRK1NzIfE8N5z7PK58O6VcU5Mn53C8VSlY4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=m5fD351W6dJL8sRlP3QvsNoqMbm7+GL1uy1pq5rcLLpJ4EhlfF3HingZ4IFrW4nMU
	 6fQH8yd78EkVlGNxqxFf/S+06+wWY3frQzyx3F1ZuXf6MJYj9W84kNgLUgq6Gi2vJx
	 G809zIp3ifQT+Uq1T2lLPh5rCLLF1/PIOy1m0pXqJEQYgeTXX74Aj/4rv665m3ghdK
	 rx+ZCJ6xErTHjS62M65nWioEOsJIkjnB7IVfNVc81eW8Ur5Tm0LJpnLlXbJVkdN+NY
	 XnlIg5YTJENkFpW5GhXZuk+F5HltfwED4WcBsmBwCB7Z4UYhRemL72G2iIRrcNK7Qe
	 PHaGopNC7q1OQ==
From: Danilo Krummrich <dakr@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: acourbot@nvidia.com,
	aliceryhl@google.com,
	jhubbard@nvidia.com,
	ecourtney@nvidia.com,
	ttabi@nvidia.com,
	joelagnelf@nvidia.com,
	gary@garyguo.net,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 0/5] gpu: nova: adopt driver lifetime infrastructure
Date: Fri, 29 May 2026 02:21:13 +0200
Message-ID: <20260529002113.2305989-1-dakr@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260525225838.276108-1-dakr@kernel.org>
References: <20260525225838.276108-1-dakr@kernel.org>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, 26 May 2026 00:58:28 +0200, Danilo Krummrich wrote:
> [PATCH 0/5] gpu: nova: adopt driver lifetime infrastructure

Applied, thanks!

  Branch: drm-rust-next
  Tree:   https://gitlab.freedesktop.org/drm/rust/kernel.git

[1/5] gpu: nova-core: use lifetime for Bar
      commit: 88b70f5a05af
[2/5] gpu: nova-core: unregister sysmem flush page from Drop
      commit: d8143c9e988b
[3/5] gpu: nova-core: replace ARef<Device> with &'bound Device in SysmemFlush
      commit: 17b6544ec141
[4/5] gpu: nova-core: gsp: replace ARef<Device> with &'a Device in sequencer
      commit: 859805f070bb
[5/5] gpu: nova: separate driver type from driver data
      commit: dc395c2831b5

The patches will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patches are queued up for the upcoming merge window for the next major
kernel release.
