Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A284457E6B
	for <nova-gpu@lists.linux.dev>; Tue, 29 Sep 2026 19:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790709170; cv=none; b=EauAodr9wfEHBO1Lku3hl2CvoOXw9lUGsAVwlWkeSLkIsbwJg3niAjmqajewYC7ugfOWvwt85o/12ChiGvLCsA6eEnlzTvUcEF9stlplQpSdntHl7oAqQKA6HUSkoj6v3ghqKfksJQ1kQlhEpDhCL4Rx3x0PBfzbqNlrJ8uXyf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790709170; c=relaxed/simple;
	bh=h3P/FtyylIrXeZCITGJELr+MDBPqnoA5vl6Z4vSbqj8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VewW4TP1woTWl1ISTFH2bDV/kyBa4Bo1S/l/hId6MTPEEglzLfaRdUrqMwg0qxCPOi0TxKRle9pcz8hGKyMzV4MQD5xy02o8ofy2mgz5L2uHRa4PyemHbe38By/ntWbGGMOFCkuWvrszQgg5oFwwzZsmaqPtttmA/bmJR0yAMe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bm3E8JKY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bm3E8JKY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59D501F000FF;
	Tue, 29 Sep 2026 19:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790709168;
	bh=D9cu68nbOlK5TZxLRlMSm5RYXYKueBBru+xFJ2T1S88=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Bm3E8JKYuYccahbjIrtY94dbQo+10kdBk0rOO/CFcey2w09VHVVbEK5ejTZRxDf5f
	 XEvTJclrUqTFnXbYmXwhPyHIsBco1+ClaaOk0sEKbBCsi7TZdwn3roFeKhqg4TkgoJ
	 kgiTyDnep/qMIxky0bSWMQ1Oc8270cSwun+hCAk/81IApB8bya5JOmQAntIYdHfaCj
	 Pr52UUqZcXdubwQ0JVMAQaLZlZbDnuBm8xtSRIew+7RxQ31doyLSDIbjqToTu1Y0IG
	 JEvxZQuriQvstGPCpAGoZGOPeyhobYmpw6fkVbK4za7uWqjQXKo7WkuCgnprusLXaY
	 +GxXw6HJewbPg==
From: Danilo Krummrich <dakr@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: acourbot@nvidia.com,
	aliceryhl@google.com,
	gary@garyguo.net,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] gpu: nova-core: use a single try_pin_init!() block in probe()
Date: Tue, 29 Sep 2026 21:12:45 +0200
Message-ID: <20260929191245.2259598-1-dakr@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260927144417.1280385-1-dakr@kernel.org>
References: <20260927144417.1280385-1-dakr@kernel.org>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sun, 27 Sep 2026 16:44:03 +0200, Danilo Krummrich wrote:
> [PATCH] gpu: nova-core: use a single try_pin_init!() block in probe()

Applied, thanks!

  Branch: drm-rust-next
  Tree:   https://gitlab.freedesktop.org/drm/rust/kernel.git

[1/1] gpu: nova-core: use a single try_pin_init!() block in probe()
      commit: 658c5f0042e6

      [ Drop useless dev_dbg!() in probe(). - Danilo ]

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is queued up for the upcoming merge window for the next major kernel
release.
