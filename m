Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010019.outbound.protection.outlook.com [52.101.193.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F8039184B
	for <nova-gpu@lists.linux.dev>; Fri, 18 Sep 2026 01:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789693686; cv=fail; b=m1uzUr9KrsG5zvIy8RODcIuT8rR4Io4Rg3TPBofVhT1N+k6SvmmFK2lm561EMaFlzhaCTs1ji/7P2oEc9z1Cb/0KDJr5AR9D6RIRFn9SoaUKHWqGZj/rMfJX07fZUPgNA2Lp3eNvoFlrWFDZTfxS/eVL131Cr0jFqxgMVP8Zqmg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789693686; c=relaxed/simple;
	bh=ymJDKc0/Mypa4mT3ex6jhfCpBronmtmt4+Bgpsb8s80=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=chQJYPtVgbaitmCcRGwmqYPIbLAT922jl9E+UAcER5I26ds6/JbJGiy30K4O1osutgY4xDKpnhiNEK+T2EOcwPnWeQ9Vf0cYL4d8Xi/02MwxNqKo1IoFikWBXC5U+9Jpu4ErcGcT8hPmv6DMqc5i2ms4gcgCF/FCWTjogQZA1zo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fzhYCrii; arc=fail smtp.client-ip=52.101.193.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fzhYCrii"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=olYojiPwVVnIz/GXdWMDkHVKsjMRj6IVtYmWV5Y2rSWPW7/ubXU36ycxvDCFz0qnRHDEdsjDTpKzSjw3gBe0YKj/2m1uzRHxFXA2CqRM8Sj7ZsWV82NItjBVGEJI50I13pouxRRhWlK/tApLqzW7Q+8eybP7IZ/QbjvDS0RR7BmFC6uziL730k4stsQIQL21b/tddP6F/LJ4sur4iZ44i3v4v/O5qCrQEgXQJ7rhmkZoPTyMVsVmYUDUA9C5VExVeRWaR0ON6QIdLcOP9HCzVVnlz+JImS0DiEtAbj+XqJO0Mtn2dKKQE8Ynby14D1rTCmhuW5nlf9vOfkZblvSIzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y9TI+6THcvBQlQJFJRLpQGFdBRbEqpsVI0zGlpDofWQ=;
 b=Wi4pYmsXW97asxc66MKk2iXZiZ0CayTjMrcsm9fzmBaMVoX2diTjU+DLcBXvNSPgrRtFun2+Mb4G7j8fva0bfzsGfpKfytKdbtlc94/VtragRJKFxt05BU7ldrOsZ+76A9tLFZxnb6PN8DtnrgXaiq0K1tiJ7LUlLgPJxLik4Zn/YwV46jPLzZXoP+LsHLi9EZsHUBnLpooQMG/wyQZgWpuy3uHLN7gWQvlmkR4jtBXnU5i81gHEbZb/0Bnz9H2GuEd7n+78TWP2norKHSHBh1FjHWrDVtmjTURuBC9sCqm+D3EfRfzbLtseeVQ6oB/163nAWEttXeOLfCHpM909AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y9TI+6THcvBQlQJFJRLpQGFdBRbEqpsVI0zGlpDofWQ=;
 b=fzhYCriin+X1J29ieLGyMdwsROoEE9I/ILIp7ew2aFLA+QdKCu5CHiO+RL0OuzDtchKwBCckR4tKOrmLystz/Ar7iiPf8IcG6F+98A46FnmDtHa0dTDamn3l1y7fjdt4oE18mS/HLOH9w29R0W7PYRhnDecUkZCHhqk+XFahef9Wmc0E2j7CCEzRpAuB0kk3t9D7ZpZ/C/pKK5x6x3cswlboAWJ311NWgbAQdPkJRpzjuJTZR1qXQ2vfmC1OpvgiIoJBHjR2dO1g5ItPmmdhMooF7vuz76x6sGtcGD7jfixrybkIXfUMnabLVcRFKzGOMF5awyqWifksM4eUfFBvMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS7PR12MB5888.namprd12.prod.outlook.com (2603:10b6:8:7b::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.13; Fri, 18 Sep 2026 01:07:39 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0406.007; Fri, 18 Sep 2026
 01:07:39 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Cc: Timur Tabi <ttabi@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Zhi Wang <zhiw@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	nova-gpu@lists.linux.dev,
	LKML <linux-kernel@vger.kernel.org>,
	John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH v3 12/33] gpu: nova-core: gsp: add GMC dispatch on receive
Date: Thu, 17 Sep 2026 18:06:58 -0700
Message-ID: <20260918010719.1176945-13-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918010719.1176945-1-jhubbard@nvidia.com>
References: <20260918010719.1176945-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0054.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::29) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS7PR12MB5888:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fa42dee-138a-4d06-f8b8-08df15213c09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|7416014|376014|1800799024|10067099003|3023799007|56012099006|6133799003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	EiyS6tL5pVkszmkG9nkNlkvzWAD6horyJfcz2maef9Qf1RjE28o6ombCIZxElg8EG9eFOHmnA75LZbNrBM+c6ZpTm/gn4EhKVzCi9mLdsE91VMR2vnmBA2ArewV+sFgXDiecLify6hIymQ/ZfpVEu0n8WipJVE10UEj+0jcCFy7azQwR0B7JRqwv+ZDVeW5oPsFmCANgTWI17LiUb6AkusrhVFCqj9KFsmAtC3lmoSb3GFJtc2T6tYsbGVW0RQX5x4HY2wMSz9guzDrFRaEKrDlgaZeCXFa+9rXeH8mkHuuyXL5RJL3Rj9X/chhWbWXAZtrieW/daiwKuKHpGl7xhu5RPM/XPcyaYnMJL867tXWTUVEvHvTiyKkDoUNQnHKKATXMzzfyIvUaLi6Jt/+zZ7jv0XByln6EilF6LQpvLXvPZxIlslnWKwyAWOU20B4Emcl25EpiJAmWKctVJ9KydKe+1NzSr3bFI+WK4rGYw6XD9hvdQtOhyohqqWQ+vC0PDF0oJvFDGCkpp0G5kzoeKUdW1U1MBZkBVDI13dhYEwFLr2oDJU26uOa5GdoTyWUiPzDLlpBLWnG+gGTsYBLz1Xp3zXPQe78K5v0yzBIm+ayf6obv7uOykKc2fSiGpnY7t+CXPclSmkMnTgnnKmaP0DKakyhhD6VzBdzqRV3yzgw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(376014)(1800799024)(10067099003)(3023799007)(56012099006)(6133799003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?i8poICzc/SOwLRCC/9hFGfy8mTl5ozsoGk2Jky5utmBryiWX71M+a/UGATje?=
 =?us-ascii?Q?p2quDb2QbbUMSGj5Kk6Tcvvva3BN/HuA0qUUcWYQAkfnYO6mxMRNoizMqZtl?=
 =?us-ascii?Q?IsZTIxoIe7NAfkA62dDQktVSXRccuwugTk1OlHMuO+JbqybiugxS3EdWSu1u?=
 =?us-ascii?Q?+VrW2CC8ZjJRw8Gp112Bk/NCjDcFMWuZUW3tWxD9+KXTwDPT0zKNbwLa21aa?=
 =?us-ascii?Q?ZKCah7k8V8iCK179VxbNZ9lPkaol2HCCKzIIVNlQn+9PoXfgYFChO6KqrtgR?=
 =?us-ascii?Q?8wyb9QFWwwALcTt4SKMGkIVknvGxjVtSPtZcBa0bL77Ro7TzK1gdVXq+Ba/B?=
 =?us-ascii?Q?beKQvdk6Lp7wuDIBAkVMhZ5T30qupRz7mek34VDgcArTqhE05TPc0cWzYJUs?=
 =?us-ascii?Q?OWtg9EXD4+ZYO+mmbRiqo2k4aWn2U3xHrqhhvGfm9NosCfSF/nHEVeRoISmc?=
 =?us-ascii?Q?r8VBfufysp7nvk0k+tzkiIC9nKX+3c6OU+TWa6XhrctfCCSH6D5tpofmySfT?=
 =?us-ascii?Q?T9v2RozDY4KU88Vy91+hYj6YH55h0wvBdggeavhAvPbQfPy/NxgGobNtSiVw?=
 =?us-ascii?Q?U4rkH88M/o3i4QcGWbxlWn3cLo3gVtIDU+82t/vuCs1hsKO6obeMoOz2FxIx?=
 =?us-ascii?Q?zRpw2xSYRFAskleJaWNhHNMRCULfmDep5skTjYQ6Ve2hVDVzzy5rcR97WdRk?=
 =?us-ascii?Q?HTrb/UhZFXcGpGRuPe893j2CXhPKZr4XsFstNCf0WqcPJswSNCGy7a0vdg25?=
 =?us-ascii?Q?N+NsNm6AFSy/DIBdykUhmZNkhdUu60VoUtYhpDBXtkVZxPfcq2rRia4U4XQ2?=
 =?us-ascii?Q?29Fg63eGJtjnIdH5OnRWXlpvv2VspWaLPRZ15ymGbs8NQVhSUWtraPK2F2BA?=
 =?us-ascii?Q?hnazRqbf7woJpYLZpfayVG1TpXSjjc6L8UMWrvTqzyBGOHi2LjtEz6CilIof?=
 =?us-ascii?Q?B0olLXzvWv5acmakHna8WE0GzB5U8EZbKhPPawvp3wE9Izsd8eSm1MzqJVOd?=
 =?us-ascii?Q?14DZWftpQ1Fe6IWp2eU0Jxwk/5zAiR3dAZoABQq9wYm3Fh3pXxOkXUsMt5wy?=
 =?us-ascii?Q?Hle+/J4PLDG3ByVxNb81uFvLHrjnRlZkXsVEq5X/yB9Ps6+qv2Gjbd7c+dZB?=
 =?us-ascii?Q?Wnt7CFZkMSHJ14xIdpZ/UrUN/Xk9dAMyJwwOJ531j1dFnMECufLYTCtaSMKB?=
 =?us-ascii?Q?q27BpMJfTsuFaXf9JJd5I/dnkz+twbj/n26jF4Wd2S463JJJhAgsWk0FETh1?=
 =?us-ascii?Q?EykkqBtaZql5cP3SQ7FJhNpsngh+a1Dhq3lQjan8H2CW3XbEEiVCVIRqqOsy?=
 =?us-ascii?Q?ZhyG8c6fgP1G0UOhEe5C4n0L11sRkDP33vbss11lqdHY0RUVztAhe31+atBB?=
 =?us-ascii?Q?GRzqGjAOS5S+xQsSHuRjuQttsMALsgvH3bRi4FLq662++FtC7q/U5KYsgROf?=
 =?us-ascii?Q?ka8T/36kb/FTtIndgbUHjbuWnrgP32zIWb7s6Ev5T/gHqIYif0/E/aNBkbhP?=
 =?us-ascii?Q?7Fx2vqes6Hwwvk9IuhM2DUzDr1tOCdBLbDq0ssUB1ojKVy0GaO+FgQMJZqvR?=
 =?us-ascii?Q?K4/QNMLWCZo/5qQXYwSbjcmCl1POrPdm5I4tpljJ2mPUQioyCIRw6vbSZ81h?=
 =?us-ascii?Q?4dGfrvki4g5LS8XZgSc9s3hTkh9zfPBYXe7NfNeAddv9oDfMbjrhCPiVthBq?=
 =?us-ascii?Q?q4KK9uxRfymSx6piPk7G2sFSqwYzSkNy4l5bnBKGZWZnrP+EIa2pa9MCpUEI?=
 =?us-ascii?Q?l2WByGqH8Q=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fa42dee-138a-4d06-f8b8-08df15213c09
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 01:07:39.6776
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OUi3eqVgNBU5fDKWC+Nty6wLxZAjxMGB6TEH5VsX91X8hg4u+jGLczqCQAhSFHePSiZE5TJIJUFyuindFhYDIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5888

The r000 boot protocol delivers its load-and-execute steps as GMC
events, each named by a command id. A GMC element states its payload
size twice, in the GMC header and in the queue element header, and
GSP-RM writes both from the same payload.

Add a receive that passes a GMC element's command id and payload to a
handler that the caller supplies, and that logs and drops an element
that is not a GMC element. The read pointer advances past the element
whether or not the handler accepts it, so that a handler receives each
element once. An element whose two payload sizes differ has a corrupt
header, and the driver cannot know which one is correct, so the receive
poisons the queue rather than trust either size. This receive has no
caller yet.

Assisted-by: LLM
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 104 ++++++++++++++++++++++++++++--
 drivers/gpu/nova-core/gsp/fw.rs   |   8 +++
 2 files changed, 107 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index a1bf536dc109..b202bd8185ba 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -480,7 +480,6 @@ struct GspMessage<'a> {
 /// A GMC (GPU Management Controller) API message ready to be processed from the message queue.
 ///
 /// This is the message that [`QueueElement::Gmc`] carries.
-#[expect(dead_code)]
 struct GmcMessage<'a> {
     // The queue element header and the GMC API header that open the element.
     header: &'a GspGmcMsgElement,
@@ -506,7 +505,6 @@ enum QueueElement<'a> {
 
 impl QueueElement<'_> {
     /// Returns the number of queue slots that the element occupies.
-    #[expect(dead_code)]
     fn element_count(&self) -> u32 {
         match self {
             Self::Gmc(message) => message.header.element_count(),
@@ -627,6 +625,21 @@ pub(crate) fn send_command_no_wait<M>(&self, command: M) -> Result
         self.inner.lock().send_command(command)
     }
 
+    /// Receives one GMC event and passes its command id and payload slices to `handler`.
+    ///
+    /// This method may sleep while waiting. The queue mutex stays locked across the wait and the
+    /// `handler` call, so `handler` must not call back into this [`Cmdq`].
+    ///
+    /// See [`CmdqInner::receive_gmc_and_dispatch`] for the return value and the errors.
+    #[expect(dead_code)]
+    pub(crate) fn receive_gmc_and_dispatch<R>(
+        &self,
+        timeout: Delta,
+        handler: impl FnOnce(u32, &[u8], &[u8]) -> Result<Option<R>>,
+    ) -> Result<Option<R>> {
+        self.inner.lock().receive_gmc_and_dispatch(timeout, handler)
+    }
+
     /// Waits for an unsolicited GSP event of type `M`. Events that arrive before it are logged and
     /// consumed.
     ///
@@ -1097,9 +1110,9 @@ fn payload_slices<'a>(
     /// # Errors
     ///
     /// - `ETIMEDOUT` if no element arrives within `timeout`.
-    /// - `EIO` if the queue is already poisoned, or if the framing is invalid, which poisons it
-    ///   (see [`Self::poisoned`]).
-    #[expect(dead_code)]
+    /// - `EIO` if the queue is already poisoned, or if the framing is invalid, or if the GMC API
+    ///   header and the queue element header declare different payload sizes. Each of these
+    ///   poisons the queue (see [`Self::poisoned`]).
     fn wait_for_element(&self, timeout: Delta) -> Result<QueueElement<'_>> {
         if self.poisoned.get() {
             return Err(EIO);
@@ -1146,8 +1159,89 @@ fn wait_for_element(&self, timeout: Delta) -> Result<QueueElement<'_>> {
             )));
         };
 
+        // GSP-RM writes both sizes from the same payload, so a difference means that one of the
+        // two headers is corrupt, and the driver cannot know which.
+        if payload_length != num::u32_as_usize(header.gmc.size) {
+            return Err(self.poison(fmt!(
+                "GMC seq# {}: GMC API header declares {} payload bytes, element header {}",
+                header.gmc.sequence,
+                header.gmc.size,
+                payload_length
+            )));
+        }
+
         let contents = self.payload_slices(slice_1, slice_2, payload_length)?;
 
         Ok(QueueElement::Gmc(GmcMessage { header, contents }))
     }
+
+    /// Waits for the next queue element, passes it to `f`, and advances the read pointer past it.
+    ///
+    /// The read pointer advances whether `f` succeeds or fails, so that `f` is called once per
+    /// element. The element and its payload slices are valid only inside `f`.
+    ///
+    /// # Errors
+    ///
+    /// - `ETIMEDOUT` if `timeout` has elapsed before any element becomes available.
+    /// - `EIO` if the queue is poisoned or the element is invalid, as [`Self::wait_for_element`]
+    ///   describes.
+    ///
+    /// Errors from `f` are propagated as-is.
+    fn consume_element<R>(
+        &mut self,
+        timeout: Delta,
+        f: impl FnOnce(&Self, QueueElement<'_>) -> Result<R>,
+    ) -> Result<R> {
+        let element = self.wait_for_element(timeout)?;
+        let element_count = element.element_count();
+
+        let result = f(self, element);
+
+        self.gsp_mem.advance_cpu_read_ptr(element_count);
+
+        result
+    }
+
+    /// Receives the next queue element and, if it is a GMC element, passes it to `handler`.
+    ///
+    /// `handler` receives the command id and the payload that follows the GMC API header, as two
+    /// slices because the ring may wrap, and returns `None` for an element that it declines.
+    ///
+    /// Returns `Ok(None)` when `handler` declines the element or when the element is not a GMC
+    /// element.
+    ///
+    /// # Errors
+    ///
+    /// - `ETIMEDOUT` if no element arrives within `timeout`.
+    /// - `EIO` if the queue is poisoned or the queue element header is invalid, as
+    ///   [`Self::wait_for_element`] describes.
+    ///
+    /// Errors from `handler` are propagated as-is.
+    fn receive_gmc_and_dispatch<R>(
+        &mut self,
+        timeout: Delta,
+        handler: impl FnOnce(u32, &[u8], &[u8]) -> Result<Option<R>>,
+    ) -> Result<Option<R>> {
+        self.consume_element(timeout, |this, element| match element {
+            QueueElement::Other(_) => {
+                dev_warn!(&this.dev, "GSP GMC: dropping non-GMC queue element\n");
+
+                Ok(None)
+            }
+            QueueElement::Gmc(message) => {
+                let header = message.header;
+                let command_id = header.gmc.command_id();
+
+                dev_dbg!(
+                    &this.dev,
+                    "GSP GMC: event: seq# {}, command_id=0x{:x}, length=0x{:x}\n",
+                    header.gmc.sequence,
+                    command_id,
+                    header.length(),
+                );
+
+                handler(command_id, message.contents.0, message.contents.1)
+            }
+        })
+    }
 }
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 5548ca77f49b..f23d071f0e16 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -1052,6 +1052,9 @@ pub(crate) struct GmcApiHeader {
     reserved: [u32; 5],
 }
 
+/// Bits of [`GmcApiHeader::command`] that hold the command id. The high byte holds flags.
+const GMCAPI_COMMAND_ID_MASK: u32 = 0x00ff_ffff;
+
 static_assert!(size_of::<GmcApiHeader>() == size_of::<r000_00::GMCAPI_HEADER>());
 static_assert!(
     core::mem::offset_of!(GmcApiHeader, command)
@@ -1075,6 +1078,11 @@ pub(crate) struct GmcApiHeader {
 );
 
 impl GmcApiHeader {
+    /// Returns the command id, without the flag byte.
+    pub(crate) fn command_id(&self) -> u32 {
+        self.command & GMCAPI_COMMAND_ID_MASK
+    }
+
     /// Returns the `NV_STATUS` that a response carries.
     ///
     /// The value is meaningful only on a response, which GSP-RM marks with a flag in the command
-- 
2.55.0

