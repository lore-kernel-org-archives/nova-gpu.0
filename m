Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0163EFFCE
	for <nova-gpu@lists.linux.dev>; Wed, 27 May 2026 17:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779902162; cv=none; b=LCqSuJeVtJtBhU2EwfksMHvYAPIKIoymr/1KPtH+69Bjab6BpVqH24Cp/hZ/EpPrCfsknTN+JLkJPZgJb7F/QZKGUOYqt5DTnfD92Lh6RiEUow8UOivd6U8O+ZwdZw6Yz+BLvHTExTo0V5JBHkwRC2DPt8dsv6k7JoHn6lLRYQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779902162; c=relaxed/simple;
	bh=2JQZxwBIF2ov8gE3PJoRyVQfnmmKpInSArWNiCRiODw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:content-type; b=s072JX2U1gOXad5DBVybmogYR0zshcD2uswCyroRSrDIZwl3z/UKUpba/YtVEqmuPr+kCqgbtaUIhYkDEScwtAmi9gI/1cqWachQWvnSLR2f+JfKkMaACr27rPwjIzEjlawr1qzHVLAddqlO4hMi9rLa0r+jkxyx24hFSGzerng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BKmILYm8; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BKmILYm8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779902160;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=sVR4w/bJZ+gLns5rGEscxsF0pfUh38oD7KsVlfT+LAc=;
	b=BKmILYm80s68pac97YWOOcvxGqynDn5Epjr/4kWpacPJR9RKsbdzZQZ/xXiGC1voEaXr9P
	iaUhkrz2DhHAPI7AvavJ9efSIqnBqBqOIZZTzfZu+DNMGYdXLgOtRJUNw3wrMFSycEy023
	PM9YLtWCYm0DTgy4L0+bXvvhnzFKfUY=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-575-e4mBIj0yMaafX_Wq_lFkRw-1; Wed,
 27 May 2026 13:15:55 -0400
X-MC-Unique: e4mBIj0yMaafX_Wq_lFkRw-1
X-Mimecast-MFC-AGG-ID: e4mBIj0yMaafX_Wq_lFkRw_1779902153
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7B778180060D;
	Wed, 27 May 2026 17:15:53 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.81.166])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id EC2EC180034E;
	Wed, 27 May 2026 17:15:51 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nova-gpu@lists.linux.dev
Cc: "Alexandre Courbot" <acourbot@nvidia.com>,
	linux-kernel@vger.kernel.org,
	"Simona Vetter" <simona@ffwll.ch>,
	"Alice Ryhl" <aliceryhl@google.com>,
	"David Airlie" <airlied@gmail.com>,
	"Danilo Krummrich" <dakr@kernel.org>,
	"Lyude Paul" <lyude@redhat.com>
Subject: [PATCH] gpu: nova-core: vbios: Fix clippy error in Vbios::new()
Date: Wed, 27 May 2026 13:15:21 -0400
Message-ID: <20260527171521.2406456-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: LNrUMSNZ3ZpetIjT4Y3Z1IvnOtDxgbpCZ7Av30xdefk_1779902153
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

From clippy:

  error: this `if` can be collapsed into the outer `match`
     --> drivers/gpu/nova-core/vbios.rs:328:21
      |
  328 | /                     if pci_at_image.is_none() {
  329 | |                         pci_at_image = Some(PciAtBiosImage::try_from(image)?);
  330 | |                     }
      | |_____________________^
      |

There should be no functional changes in this patch.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/nova-core/vbios.rs | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
index c0bc1008ed752..d38d7f138b49d 100644
--- a/drivers/gpu/nova-core/vbios.rs
+++ b/drivers/gpu/nova-core/vbios.rs
@@ -323,11 +323,9 @@ pub(crate) fn new(dev: &device::Device, bar0: &Bar0) -> Result<Vbios> {
 
             // Convert to a specific image type
             match BiosImageType::try_from(image.pcir.code_type) {
-                Ok(BiosImageType::PciAt) => {
+                Ok(BiosImageType::PciAt) if pci_at_image.is_none() => {
                     // Silently ignore any extra PCI-AT images.
-                    if pci_at_image.is_none() {
-                        pci_at_image = Some(PciAtBiosImage::try_from(image)?);
-                    }
+                    pci_at_image = Some(PciAtBiosImage::try_from(image)?);
                 }
                 Ok(BiosImageType::FwSec) => fwsec_section = Some(image.data),
                 _ => {

base-commit: 2cf1840b0fa7637b6731fd554529f8d57ea34c04
-- 
2.54.0

