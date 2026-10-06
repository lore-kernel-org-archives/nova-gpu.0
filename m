Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447003AA510;
	Tue,  6 Oct 2026 11:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791287637; cv=none; b=s3xLFRqsQ507ajeTzgy37sJIey03hcvcjSuN0xPqtxoDEY/pMFKoyWi9fhaelzZWgw3sADAv+Kv6exwArvbm+GFcagurvftH2Y/ZZyUznXmYbqVTLPo+jhsBOLIce6mopkTx29ffNzueH4+0dajqP8hs3mVDwv+nFVYrA8p9Txo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791287637; c=relaxed/simple;
	bh=VetweA1aMKnwvp/z6U6ngiU40fTiotUsT0isaYLH2nU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gAB/Ok341+iMCUkE4uVJEo0vZ1nMSgBxFefWCbt+FNt5Q4JtpZ7/U6myNYL6EaNXOd20upMY/qg6iUENjryFEfVq/bUUWIQaHgKFOpNET1k4Yhm5jMeTZTXF7rK+Xav35e73jHpytiQvrN3EztCp/XgJqZDZd2Tuph2GlpNmhB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LNqUMrpZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LNqUMrpZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB03D1F000FF;
	Tue,  6 Oct 2026 11:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791287635;
	bh=pm06+NkcSQVhTckq2o+B0jIj5R0QdwE0Dppd+dgufN8=;
	h=From:To:Cc:Subject:Date;
	b=LNqUMrpZgBVOLJSZ/W/MvA4gaS5eLGfbM29hyELkMy+C5gL5fIj5/sPuiqbsz8aih
	 9qgYrjPfyC56shoPoNkk9g2LjskPA9VsvwCaA06BAMQ2Wq4tCxRRxFa/lmGSP79d40
	 KZG2pz9bEKE9qjcnB8tiHaUiRsT3kFM0DoTrIqM16un8ROE/XYT9+QSkekALTXLSPb
	 S+9ZPun9DMuNdGc2pbrEwyqXU4KKAIvkSd3QG89YJCnjpuIijhArElc5rKbsHpNZrV
	 ZT5kfam8A7V2HNBUDeBv1gcrCX8MUtK+lO8bPjkP4hWPrtM1qM+goOMZAAaPEXtStX
	 n8tb3ZBR1R83g==
From: Thorsten Blum <blum@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Gary Guo <gary@garyguo.net>
Cc: Thorsten Blum <blum@kernel.org>,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] gpu: nova-core: gsp: use KVVec::zeroed() for payload buffers
Date: Tue,  6 Oct 2026 13:53:06 +0200
Message-ID: <20261006115311.92873-3-blum@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1795; i=blum@kernel.org; h=from:subject; bh=VetweA1aMKnwvp/z6U6ngiU40fTiotUsT0isaYLH2nU=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFlHHqpfm9o2s1SW41RCvNtzc4OZK9ed9M3b7zqP06r87 tW1ByKndZSyMIhxMciKKbI8mPVjhm9pTeUmk4idMHNYmUCGMHBxCsBEntsyMryLCCg+cU22NvP3 /SN7Li282nR136Q5XhvuBvzeorBkyqMljAwX5jv53jeXUeh3NdnItW/miuMLok6XW/NaK82Os5E sf8UNAA==
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

Use KVVec::zeroed() instead of KVVec::from_elem() to allocate and
zero-initialize the command and continuation payload buffers.

Also use KVVec::zeroed() in the test helper read_payload().

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 drivers/gpu/nova-core/gsp/cmdq/continuation.rs | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq/continuation.rs b/drivers/gpu/nova-core/gsp/cmdq/continuation.rs
index 05e904f18097..9ef19f28de97 100644
--- a/drivers/gpu/nova-core/gsp/cmdq/continuation.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq/continuation.rs
@@ -106,9 +106,9 @@ pub(super) fn new(command: C) -> Result<Self> {
 
         if command.size() > MAX_CMD_SIZE {
             let mut command_payload =
-                KVVec::<u8>::from_elem(0u8, payload_len.min(Self::MAX_FIRST_PAYLOAD), GFP_KERNEL)?;
+                KVVec::zeroed(payload_len.min(Self::MAX_FIRST_PAYLOAD), GFP_KERNEL)?;
             let mut continuation_payload =
-                KVVec::<u8>::from_elem(0u8, payload_len - command_payload.len(), GFP_KERNEL)?;
+                KVVec::zeroed(payload_len - command_payload.len(), GFP_KERNEL)?;
             let mut sbuffer = SBufferIter::new_writer([
                 command_payload.as_mut_slice(),
                 continuation_payload.as_mut_slice(),
@@ -235,7 +235,7 @@ fn init_variable_payload(
 
     fn read_payload(cmd: impl CommandToGsp) -> Result<KVVec<u8>> {
         let len = cmd.variable_payload_len();
-        let mut buf = KVVec::from_elem(0u8, len, GFP_KERNEL)?;
+        let mut buf = KVVec::zeroed(len, GFP_KERNEL)?;
         let mut sbuf = SBufferIter::new_writer([buf.as_mut_slice(), &mut []]);
         cmd.init_variable_payload(&mut sbuf)?;
         drop(sbuf);
