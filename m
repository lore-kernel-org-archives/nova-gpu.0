Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4E034F275
	for <nova-gpu@lists.linux.dev>; Thu,  7 May 2026 22:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778191281; cv=none; b=Otn906csVV5zOuEPZWw3bvKyifYv7SerGn96nTrbF9F+V5/2/7VOZa7HMcxk4Kpi2AwaK+K2yX3lODrs0GNnToqG+h0XUGI1TSeer4U/k6srY6F4JeuqIV7LGd9Lx6YZp+DS9GffLH/X1Us4afGeIHtVPoNaH8Ey5Rq1DnM2zNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778191281; c=relaxed/simple;
	bh=GOQ6mvElV0RZoU+9bcgN9iqXnJGGY7cnp+CLFNkJupk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=G7V0xvAwUfVjzJpIIKxaiLW1DDXKWdeSK1LVLyczCR6SCd6bx/RBCJUxqfFQ96J6QpFWubxc3yCEvWoku2h2x6aTEuE9ZFp1eWCQehQC8bsLOsvtlPaenZN7YuFs84XxQVsxe0ecKqtImzulqA7Ip4p0u4vvxDntpWNlTTEUIeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=O1fK2ER/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="O1fK2ER/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778191279;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fLt3WGeAszQOp0olBKNdpytn+4u5isqNVmxsJU5nCFE=;
	b=O1fK2ER/371xiBahkScki51hHZx+dLoSD8QwrdzuRYzk2+DpYEMAc7bXtk6I81Sc5uKT5p
	UFtvzwE/X9nOEnDT150oiKslvhpsuxKobbxjsjGTG9GuPh1DgqCy3Konhby2Q96L1+evKQ
	cOWU9gV2iWd9yWb7saV5cgHBpJv2LEU=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-338-HeX9_qVcM2m-bxzIpFFgSQ-1; Thu,
 07 May 2026 18:01:17 -0400
X-MC-Unique: HeX9_qVcM2m-bxzIpFFgSQ-1
X-Mimecast-MFC-AGG-ID: HeX9_qVcM2m-bxzIpFFgSQ_1778191275
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D58E41956080;
	Thu,  7 May 2026 22:01:14 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.89.165])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6DB0F300019F;
	Thu,  7 May 2026 22:01:12 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Cc: "Gary Guo" <gary@garyguo.net>,
	"Miguel Ojeda" <ojeda@kernel.org>,
	"Simona Vetter" <simona@ffwll.ch>,
	"Alice Ryhl" <aliceryhl@google.com>,
	Nova-gpu@lists.linux.dev,
	"Shankari Anand" <shankari.ak0208@gmail.com>,
	"David Airlie" <airlied@gmail.com>,
	"Benno Lossin" <lossin@kernel.org>,
	"Danilo Krummrich" <dakr@kernel.org>,
	"Asahi Lina" <lina+kernel@asahilina.net>,
	"Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>,
	"Daniel Almeida" <daniel.almeida@collabora.com>,
	"Lyude Paul" <lyude@redhat.com>
Subject: [PATCH v6 2/3] rust/drm/gem: Add DriverAllocImpl type alias
Date: Thu,  7 May 2026 17:59:20 -0400
Message-ID: <20260507220044.3204919-3-lyude@redhat.com>
In-Reply-To: <20260507220044.3204919-1-lyude@redhat.com>
References: <20260507220044.3204919-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: Djuvb_kABUKM4zpwTPZa81VXkKqcZ8-ahI2U99NHyiw_1778191275
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

This is just a type alias that resolves into the AllocImpl for a given
  T: drm::gem::DriverObject

Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 rust/kernel/drm/gem/mod.rs | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
index 75acda7ba5001..568b5c08019e7 100644
--- a/rust/kernel/drm/gem/mod.rs
+++ b/rust/kernel/drm/gem/mod.rs
@@ -73,6 +73,11 @@ unsafe fn dec_ref(obj: core::ptr::NonNull<Self>) {
 /// [`DriverFile`]: drm::file::DriverFile
 pub type DriverFile<T> = drm::File<<<T as DriverObject>::Driver as drm::Driver>::File>;
 
+/// A type alias for retrieving the current [`AllocImpl`] for a given [`DriverObject`].
+///
+/// [`Driver`]: drm::Driver
+pub type DriverAllocImpl<T> = <<T as DriverObject>::Driver as drm::Driver>::Object;
+
 /// GEM object functions, which must be implemented by drivers.
 pub trait DriverObject: Sync + Send + Sized {
     /// Parent `Driver` for this object.
@@ -89,12 +94,12 @@ fn new(
     ) -> impl PinInit<Self, Error>;
 
     /// Open a new handle to an existing object, associated with a File.
-    fn open(_obj: &<Self::Driver as drm::Driver>::Object, _file: &DriverFile<Self>) -> Result {
+    fn open(_obj: &DriverAllocImpl<Self>, _file: &DriverFile<Self>) -> Result {
         Ok(())
     }
 
     /// Close a handle to an existing object, associated with a File.
-    fn close(_obj: &<Self::Driver as drm::Driver>::Object, _file: &DriverFile<Self>) {}
+    fn close(_obj: &DriverAllocImpl<Self>, _file: &DriverFile<Self>) {}
 }
 
 /// Trait that represents a GEM object subtype
-- 
2.54.0

