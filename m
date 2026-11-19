Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795125437;
	b=eiI7Tu2Lb9QVbvyDeXgfiY9ZfislUtd9FWWssR76RvmEF33lXWfVALxvJ30n0m8z19Uw
	 0aElIEjArHsJ85JtWECA6seMg4VV3ASl2/O07AzTvK2jqoEgbNkG/83WgAZAl7hqdt3YX
	 ERcS27pJ4X5BYDQXjoyto3wW5aUdTXrpYzTC1MyFn+7SDbuTwAS8ouWVBMPGtYQ88tobT
	 XaEI9Rs+xzP3QOYoE0W3d6VRYv1H76i2eMd//6oabFv7zItYn3Fj1T/68Dsq1UibSuIk8
	 K/My7JmX7HptkDJ1RZsWX+F26+h5g9v3ZDssipaMNKYmnjLcO+eDh9qK81nLIqm6duw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795125437;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:X-Patch-Reply:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=RcfbHFH01RzSHnJPgcknTLx6N5kKgF6XGMIscWY4ydA=;
	b=PWPMhT0pKZiK037jdGnCQwGdx+NJ5sPCPB7UbZCvSdHPSZj/NF/zBBKRvq0R4e5cMzlc
	 p0eQ8RqHNB8T0fkqGan2MzgsXYl4CxIlMTA3ojg/2TxCU4p1KO2qtpw/CSLWZDBxxyAkP
	 dIvpUiFwSFxF8NRBKvWC/73GLbpt5Z8CDrcly1V1C9HqNmeh/pA1YwEUVzcEucl9Odo2y
	 39dfCs/36qgRTWndqR9gwL6Exq33MVF8RBsWgq0QrXwCuyTR7UDAQNDQLjnIME0Y6xtdG
	 rzb7JniS4jJw00rKbgw7L5+fHnzrCnf12PaNalb6vPRpa5APTg9wB+9cFnKY8L1HceQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GC6u7YxK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124AE606A32A;
	Thu, 19 Nov 2026 21:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GC6u7YxK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 525801F000C4;
	Thu, 19 Nov 2026 21:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795125436;
	bh=RcfbHFH01RzSHnJPgcknTLx6N5kKgF6XGMIscWY4ydA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GC6u7YxKJsHQfjm6YLA2+C4TCzramwpUjurE42mn73YzM2q4iiTSl+fGKk9FqWFBE
	 LaXK6V7vXBs/7fpnLdVkfuocbUX+ToQpIT5PeVxUk1uLPs9utrNVak5PUzJUTgjpBn
	 bLsIFOBqvhXRPdLTcedv+m/eXoXfxatEPoQv6c3Hf2J/0bXsdTw5FL5bcbd2/u3pGX
	 hRSE5ghGJC6QrmDdK5MGzfsf1hsiZ6Wg8i6XmiJD+4qvtPu6+FkAEp+9EhXfSZAo8d
	 U+S9ad6q7t0jas8URUV/NPjMnK0on0DINsT5OlHwlos8zpXYj8VNgIuX86YtR6UkW1
	 uURwWuthRnZiw==
From: Danilo Krummrich <dakr@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: aliceryhl@google.com,
	acourbot@nvidia.com,
	daniel.almeida@collabora.com,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	tamird@kernel.org,
	work@onurozkan.dev,
	brauner@kernel.org,
	lyude@redhat.com,
	j@jananu.net,
	alvin.sun@linux.dev,
	deborah.brouwer@collabora.com,
	laura.nao@collabora.com,
	beata.michalska@arm.com,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/7] lifetime-parameterized DRM File private data
Date: Thu, 19 Nov 2026 22:57:09 +0100
Message-ID: <20261119215709.3691076-1-dakr@kernel.org>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118163203.2483856-1-dakr@kernel.org>
References: <20261118163203.2483856-1-dakr@kernel.org>
X-Patch-Reply: applied
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed, 18 Nov 2026 17:29:41 +0100, Danilo Krummrich wrote:
> [PATCH v3 0/7] lifetime-parameterized DRM File private data

Applied, thanks!

  Branch: drm-rust-next
  Tree:   https://gitlab.freedesktop.org/drm/rust/kernel.git

[1/7] rust: drm: rename Ioctl device context to Userspace
      commit: 69976e5f24ed
[2/7] rust: drm: gem: gate open/close callbacks with RegistrationGuard
      commit: 6f90031b5cf9
[3/7] rust: drm: move file_operations from gem to device
      commit: acce9c14569d
[4/7] rust: fs: add iminor() helper
      commit: d63e44ab58dd
[5/7] rust: drm: wrap fops open with RegistrationGuard
      commit: 5a31079c7c5f
[6/7] rust: drm: return impl PinInit from DriverFile::open()
      commit: b8ab877d7b44
[7/7] rust: drm: make Driver::File lifetime-parameterized
      commit: fed919c71b52

The patches will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patches are queued up for the upcoming merge window for the next major
kernel release.
