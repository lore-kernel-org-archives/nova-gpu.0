Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010058.outbound.protection.outlook.com [52.101.56.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0FC938E5ED
	for <nova-gpu@lists.linux.dev>; Wed, 30 Sep 2026 03:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790739799; cv=fail; b=CYi/6wnhbBzEH9xq1Wn1pUUWsBl+IuqTzOqfVDEgv8jdxEIlGvqjKialmM/isJJ0bcpYS53u7WHSqwRnh/h5iFFRAtcDZ6gXuexcCvrL1v8z9IQARcF6YGEhWCnCBO9aveBEw+PcjQGbl1WHew9OItGf6ak476Uv+K2kBKQGUo8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790739799; c=relaxed/simple;
	bh=1Kk7b3twWjNCMvIJQ1DXCJfJzwpnTygobjCzBaqHZRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ol/vEvsVWcJ3UeFq868HyTH6+7Wphntf6adnoy17siN+9b46ZQfV58vnk2fZXBh+lmP2psizQHV6l8rloNn8sGI86/SMllD4ZRp8+lHvA4xAA6avrOh5rKJ2IwbgXvQqx/aWcjY7PwsATtaO3wcby5DoTx7lEEd/ye2Ptn2tRbo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WswZz+DA; arc=fail smtp.client-ip=52.101.56.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WswZz+DA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qwjxl7xXF8vGrMlSfvKT6amO7jccu/CuPi/SVGfRw8a5ZqHo7HoadLAa0xl72Iezhwx92LRV1vFoLPRygTPgXF1NaYe+Iw+2ui8VsPbHydZUjJnHMMIGaf1UzaoxU/otL1lWdTlyBmdjm3euRn+lHprrBU9vKkUCzLub1gvBrmZSygwdTQINhsZ0Xlk60fEy1IDZZI0BizGQotGOO5TJZj/UBJ0swWZqzfn4NAs7GGasOPNGLhLbziypE88svUQBM3GjPH4vzWqAe2L6ZfeMTTQoEsQgInp3eMCSvUfZx9rpraoVW5zFklq981w2XEAEc5tx5g53+TX8YO3nn7sQGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7gP4g9u+NALNUZlpxocV+7gJvw39s9yk8jrazeZP7Oc=;
 b=f2m3PqX1pDtvfxEawHkBfFIk4kvqn1dE1SKKugmWmej712+ekLN+kfe3Dhvlzr6jEtttmXohQcry80AzICyVDaw6TkFs7SZQlg+qq30iok+8XHIPmMJkhCBXU7dscylSeWLmVg/nCAbJ0yizeAePdf+dC2Z6VBtPwYpMfBXSuHDPGHsYC4d+utpAQnQPTnbosmrXjov+Q6ezzFRMeUwXRUnPtCVo0/PxGoB6ryyQBaADmpr2JviZT2tZ2ObzvCC8OoLoj7IGZux2vG+TdMe9oq+JEzpTMjDpZOQO0f6pmsdZE+lwQRx1DccyA2WRJlrQjYCHcWjZp+P/9NKYjnhfPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7gP4g9u+NALNUZlpxocV+7gJvw39s9yk8jrazeZP7Oc=;
 b=WswZz+DAOcsUd3F+y2VCWJ7lZwHdrQ4Zs/liHkicSQBY8jSieNeytdSsGKXXCZ1iMpCIRdDDhwEMCy/g086kVsxNVeVi6FWdD3F97++b0VDZBSj5qpFoAKsoJIewSSbwfhXP2ruMctNgMvn9h7gTUbvVHQCxgFWU2WhUZSAtXYUG/JfkAfma2Gxd2xwhBijzrcs5CGNZmtRQ/E1MqF1seRVnI4HyJsnuhgPzxL4ZrwN4n8U/s3gj/Qyt5fEPznd6IhwCIUvuKFq5nTD5Z07Vx/5h4rTEQRAaj3/tzct0bVGbE+i3Fc+r/meWjcDCzgyZAfWscBAoC4jgnMU/funGlw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MN0PR12MB6248.namprd12.prod.outlook.com (2603:10b6:208:3c0::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.26; Wed, 30 Sep 2026 03:42:20 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0451.024; Wed, 30 Sep 2026
 03:42:20 +0000
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
Subject: [PATCH v5 09/15] gpu: nova-core: log GSP events instead of discarding them
Date: Tue, 29 Sep 2026 20:41:42 -0700
Message-ID: <20260930034148.590687-10-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930034148.590687-1-jhubbard@nvidia.com>
References: <20260930034148.590687-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8P222CA0022.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:2d7::33) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MN0PR12MB6248:EE_
X-MS-Office365-Filtering-Correlation-Id: f47ce58c-367f-43a9-ebef-08df1ea4d4ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|7416014|376014|10067099003|56012099006|5023799004|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	vPhcBv/Uqxhca1hsjTpPAfP9itm00O047o6LkpjV9x/ofVSoA8FV/ARwjoEWs/d0NJIawkWyQhmDLM3XvIRb762K8jNrdIus2NYZwfU7FTS1UOTajEFUSOyWrebwlzs/3r4x5oxfrEkGwVzYm3cYJbZR7gO6/kYH8N0XnW1rdyD6b+IXfjx/alQ3D0acSjyFHPN7jDePo7oqkmRDW1GfZNRCEOFvzGNb0HVxf2jEcGO1BIiHAnzYOmt0HEyFoEpPfKmd9a6r3001m2dkVl9A97Mu1cIUcwLV5flQqKNYhxalrotVpDtcpTV76nOdY1MirD1NOPc+NfNxCZmIWIZREpyDSVZBa+1KXp3mUBf7lLgkGvhvYwoKNxK+O0DcnYkGgiL1rGDiF0yP2C7VN0Jd3tSny9/fkuJ054P7/uP/mrgzf9GfVWhzqaJazgwrad0KWOeQ7Q/23bee3K1HNT1D7fz49lxewjrLOw4lPm6ToaeHIAZPDi/p6TQJ1eWYxL1If1COM1cR5lQh/Kqu8///LsG+9AKz7XaWHdOkwz20Yf/ZNzi508Xa+seRUziIOkM4tWTjf58ndjm3id9m1W/laABDKii9s0FSSOY3tkAWx3a2iT2+mvRgSsyRel+kYCZeBW55R1WT1MMuZvh9CRHplWRihI672guTIANzlUQzELs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(7416014)(376014)(10067099003)(56012099006)(5023799004)(11063799006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Srt0xZqUlJRcXMGgpNhjp1ziGAXioqU0A2QbWzMP931xEbw/OklTm3XawDON?=
 =?us-ascii?Q?L6OSnVtNEo7ETMynXfY1S02qs9T7pC+XmSA1i7Db/9LOFr0WOjUPZTb4LDpC?=
 =?us-ascii?Q?uBJQHGZngx8qlORvZFF+Fj15PfKqLaIi24BCFA5DsX8nXNp+8X5GMnOWddaN?=
 =?us-ascii?Q?1i5qZvnRO3GRF5OxeIQyazhqjZ3fAYN/cNsfILrvy7gnyJYVNMY88d6zLUmD?=
 =?us-ascii?Q?WlnpU8Jsir4HnjMvyvyerPt0fePrOlHGh+oAtS2pPljM3KMly1VnRkxouKwG?=
 =?us-ascii?Q?sBjS5zMqV1Ixu6zOX996PN2ot3gNce+dhZmHCRsJexnkF3cNUCprUVYgV3UX?=
 =?us-ascii?Q?4CY0lyciBxJjVzyCsWv3XH/2ZSGUg795oVBxk8UCiymRGfOYc0slfQ9zT2ns?=
 =?us-ascii?Q?BfLDjAQOtEYV14NbIyW2fbqEVJv3SRK3cnL6+glAz+3/EGoQB1hn+G9gyoWY?=
 =?us-ascii?Q?h50VPbJj53BJZfGJP1CQ3fgW2h8EbxAxwsQP80PZqStrQr1+0IT1BYQ1W6YD?=
 =?us-ascii?Q?bvOWcURFba12XeI4ULDmQQfrd32Oa4BTUhjLzKxhZxIi+BhRCBXgTAM1JItR?=
 =?us-ascii?Q?Nbijd889e+7BQBfsLFm8yxByucz0TRaSDBxQQbv6Xb0ccsw42w3QS9H1Idgd?=
 =?us-ascii?Q?hYO47PF3TvRULc/rJSzrGhV2cEBN4A5+YQZQ6GkZSWHgoteiMg4CVfZKoUhH?=
 =?us-ascii?Q?9UAJWucawYNPLxm+OAD+jRbDERthFvQsDky6YadYMKsnp+yLYeGm99cceDTq?=
 =?us-ascii?Q?dM6nc7e0Nlo9QuPIt4kXn+iU1WTklxYWbeiZ8bnUjimeNTvDKqe7Hl8HvUFm?=
 =?us-ascii?Q?KX7c5gGBKr0uZ9f74ZIeuXokVRvDK7WVOqCD4WtugwsF4EvmLyblr2Va6RUw?=
 =?us-ascii?Q?7roIXCioL5+hNoFbVOlDL3Y1L5Zv7IBSgDxlottN9Zl1Far78TC4+Z2uqKt0?=
 =?us-ascii?Q?V5pOLa737256k+UpA4Xd7VVpUcSaYszRK/oP5AQCVr0qqgixsHcgVyVJVtYU?=
 =?us-ascii?Q?JvKks7V1pdpMzXCHsT6aPO03kfpRGzPh8XEP1r6CPPnfULLfUpuJcHIwIkHu?=
 =?us-ascii?Q?T4b7dtM0vEsLR14tDtFM/m8i3RlsvZCtE30x+V3xyQyHmZafT+i1b11eDsfr?=
 =?us-ascii?Q?aqdoP2JRCmCIKb4AenCAGvxIIjZ+I+nRVEiw+YNVCy2e7zwiD/GkW4HaG1+E?=
 =?us-ascii?Q?PjngttDjRUBlLY9KKsEA8Ts+sFX4eeaL3IqeZCTqf8OgvjVEeJGlFe4VZA+x?=
 =?us-ascii?Q?9gaFTmXQatE7IQ7ZvF5bZBgtrawAg+4IdIm3YufZphCvPLDhoZYdPYgv07wc?=
 =?us-ascii?Q?6CJ4Yd9OjXUSqEbVCV8063+G+RCz6EdJuOmfxvguS4uO3SDbCsMfbjgzi4Fd?=
 =?us-ascii?Q?H0tjVyZodyRjxc6JMLJm6aTPLrsMlgZ4kF0t1Q8UHIbYGPdraI/liy1pPybT?=
 =?us-ascii?Q?G+YalpVLNI9QlSCotOqtByd6xviEOISnaaZAXAhHK2Q0KZA+S2KeQxNvjUVo?=
 =?us-ascii?Q?ppz0prQJqbCGnGQzh0v5K869fNwF9JN7SCsO/N2oYHFeXDyR25JwRZZO6B54?=
 =?us-ascii?Q?uEJGducyKn7s/0glEpG+vMjyc3zJSnkvMpuDCSuwytRc98wHqvmrz5mIRyCq?=
 =?us-ascii?Q?+QAVVPk0UwH2BhDR1BO4HYvFidOIKoCU15CQ9F6mqPQ6+evcSNtGH+4yrQG+?=
 =?us-ascii?Q?xWaulESkNnfyCVAPBvsNE9LLBxV0HcnKZD9MQ3CmOyyUAcmAr1h+p+qW6IKN?=
 =?us-ascii?Q?F8iI8gq/cQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f47ce58c-367f-43a9-ebef-08df1ea4d4ee
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 03:42:20.6927
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ge2kxq/YwKovUwx8KfljE2npfdz/pu2iWSIAQ9KZ4TQij6rpuu6+j4c5TI/gmY56Xwex+sMRH9Er8jybO2RuIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6248

The GSP posts unsolicited messages on the same queue that carries
command replies: log records, OS error and robust-channel records, and
lifecycle notices.

nova-core discarded every message that was not the reply that a caller
was waiting for, and an unrecognized function code aborted the in-flight
command. The GSP's error reports never reached the kernel log.

Log every non-reply message according to its function code, on the
receive path that already reads it, and leave the in-flight command
waiting for its reply. Event payloads, such as XID numbers and log
contents, are not decoded.

Assisted-by: LLM
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 52 ++++++++++++++++++++++++-------
 1 file changed, 41 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index a5595da23407..4591f6c61ce6 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -559,8 +559,7 @@ fn notify_gsp(bar: Bar0<'_>) {
 
     /// Sends `command` to the GSP and waits for the reply.
     ///
-    /// Messages with non-matching function codes are silently consumed until the expected reply
-    /// arrives.
+    /// Events that arrive before the reply are logged and consumed.
     ///
     /// The queue is locked for the entire send+receive cycle to ensure that no other command can
     /// be interleaved.
@@ -819,8 +818,8 @@ fn wait_for_msg(&self, timeout: Delta) -> Result<GspMessage<'_>> {
 
     /// Receive a message from the GSP.
     ///
-    /// The expected message type is specified using the `M` generic parameter. If the pending
-    /// message has a different function code, `ERANGE` is returned and the message is consumed.
+    /// A message whose function code is `M::FUNCTION` is decoded and returned. Any other message
+    /// is logged as an event.
     ///
     /// The read pointer is always advanced past the message, regardless of whether it matched.
     ///
@@ -829,8 +828,7 @@ fn wait_for_msg(&self, timeout: Delta) -> Result<GspMessage<'_>> {
     /// - `ETIMEDOUT` if `timeout` has elapsed before any message becomes available.
     /// - `EIO` if there was some inconsistency (e.g. message shorter than advertised) on the
     ///   message queue.
-    /// - `EINVAL` if the function code of the message was not recognized.
-    /// - `ERANGE` if the message had a recognized but non-matching function code.
+    /// - `ERANGE` if the message was not the awaited reply.
     ///
     /// Error codes returned by [`MessageFromGsp::read`] are propagated as-is.
     fn receive_msg<M: MessageFromGsp>(&mut self, timeout: Delta) -> Result<M>
@@ -839,11 +837,11 @@ fn receive_msg<M: MessageFromGsp>(&mut self, timeout: Delta) -> Result<M>
         Error: From<M::InitError>,
     {
         let message = self.wait_for_msg(timeout)?;
-        let function = message.header.function().map_err(|_| EINVAL)?;
+        let function = message.header.function();
+        let seq = message.header.sequence();
 
-        // Extract the message. Store the result as we want to advance the read pointer even in
-        // case of failure.
-        let result = if function == M::FUNCTION {
+        // An early return here would leave the read pointer on this message.
+        let result = if matches!(function, Ok(f) if f == M::FUNCTION) {
             let (cmd, contents_1) = M::Message::from_bytes_prefix(message.contents.0).ok_or(EIO)?;
             let mut sbuffer = SBufferIter::new_reader([contents_1, message.contents.1]);
 
@@ -854,11 +852,13 @@ fn receive_msg<M: MessageFromGsp>(&mut self, timeout: Delta) -> Result<M>
                         dev_warn!(
                             &self.dev,
                             "GSP message {:?} has unprocessed data\n",
-                            function
+                            M::FUNCTION
                         );
                     }
                 })
         } else {
+            self.log_event(function, seq);
+
             Err(ERANGE)
         };
 
@@ -869,4 +869,34 @@ fn receive_msg<M: MessageFromGsp>(&mut self, timeout: Delta) -> Result<M>
 
         result
     }
+
+    /// Logs an event, meaning a message that no caller was waiting for.
+    ///
+    /// An OS error or robust-channel record is logged at error level and an unknown function code
+    /// at warning level. Every other event is recorded only by the receive trace in
+    /// [`Self::wait_for_msg`].
+    fn log_event(&self, function: Result<MsgFunction, u32>, seq: u32) {
+        match function {
+            Ok(MsgFunction::OsErrorLog) => {
+                dev_err!(&self.dev, "GSP reported an OS error (seq {})\n", seq);
+            }
+            Ok(MsgFunction::RcTriggered) => {
+                dev_err!(
+                    &self.dev,
+                    "GSP triggered robust-channel recovery (seq {})\n",
+                    seq
+                );
+            }
+            // Nothing to do for the remaining known function codes.
+            Ok(_) => {}
+            Err(raw) => {
+                dev_warn!(
+                    &self.dev,
+                    "unknown GSP message function {:#x} (seq {})\n",
+                    raw,
+                    seq
+                );
+            }
+        }
+    }
 }
-- 
2.55.0

