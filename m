Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93DF43F4A0
	for <nova-gpu@lists.linux.dev>; Sat, 26 Sep 2026 12:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790426652; cv=none; b=gsCGO3+2YJeN8H4w3q7gnoDyQySe6Gp9LWN0lZhBwIHUOuNTpJuLeOWKCXjtNl2UYYcdEDjl4stxevEcZ8mjqi/uywtrtgMEIEcChr0gG5GqJvNd1uiPkFjGFb1Lnx/EZ1uQe8yzoCQFk7xfdO5JORy5uOZiGk0bCpZPPR6YTJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790426652; c=relaxed/simple;
	bh=kc80+fRCG5zqkrmXlQ7SukpA/BrVCTRNbASv1WHFSQ8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Vpryi5C95nWQgO2udpsoz1upcItNWZ7KEJMj2LDTGiPzvDKdsOSbP9qmACtPzrzZXyjkmyZ8neztR05vPI9oWNGVa2FGsX3BfiQx2leB9rRvTpY9sLY1F1QOwB5YIGM73/i9X+rBOFNUyq7YP+QP6RlO5pJTQi8wbqpfkWKbXOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DpOyCmnG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DpOyCmnG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27E2A1F000FF;
	Sat, 26 Sep 2026 12:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790426649;
	bh=2ODxEQcjvqmkuPG+SDefLmH/+uRSXK5o4R5dGwS3vq0=;
	h=From:To:Cc:Subject:Date;
	b=DpOyCmnG6OIpkKcoLZ+Kh04cMCthlsfsrJvBnAjzAa9Gmpz/6g2Aq1a8o2SAYbJSk
	 FqxUH1NizFfK261BwYKSTmjUadKlAodINrB3JmUz+AmVMuabtschM2+MLs6xq+SAUj
	 ZfWhW+aHplYjfhFeullcxg2/lQyGzygCA1fcUOIa7bigFSnzVdPsXjPAXy2es/lyDB
	 JOj5yqQb5/oSxFfLBzHKZUyXd4qruKAiK+m5nREj8z7agFnMB6xtkpjp7FDVsTFJx2
	 KR750lWqvzoxohtI1YGgcPMNyXUPPcrdkQBmRjZ1u4YXL53tMtq8LIgQq/i5UMJzXy
	 LulvCTF1t1cdA==
From: Danilo Krummrich <dakr@kernel.org>
To: dakr@kernel.org,
	acourbot@nvidia.com
Cc: nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 0/4] nova-core: align Bar0/Bar1 and remvove unnecessary Arc
Date: Sat, 26 Sep 2026 14:43:23 +0200
Message-ID: <20260926124405.604707-1-dakr@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Get rid of the Bar0/Bar1 type alias inconsistency and the unnecessary reference
count of BarUser.

There's much more to improve, but this just crossed my way.

Danilo Krummrich (4):
  gpu: nova-core: align Bar1 alias with Bar0
  gpu: nova-core: remove unnecessary Arc around BarUser
  gpu: nova-core: mm: get rid of Arc<BarUser> in BarUserAccess
  gpu: nova-core: mm: fix lifetime name in BarUser

 drivers/gpu/nova-core/driver.rs      |  4 +--
 drivers/gpu/nova-core/gpu.rs         | 26 ++++++++---------
 drivers/gpu/nova-core/mm.rs          |  5 ++--
 drivers/gpu/nova-core/mm/bar_user.rs | 43 +++++++++++++---------------
 4 files changed, 36 insertions(+), 42 deletions(-)


base-commit: 896ed083362758b33c49a1b5e5a3423c5814d87e
-- 
2.55.0

