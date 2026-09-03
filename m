Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010058.outbound.protection.outlook.com [52.101.193.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E05334A78E
	for <nova-gpu@lists.linux.dev>; Thu,  3 Sep 2026 03:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788405338; cv=fail; b=N+jLormpW9gKyBAUZH+t+i//fpV40G6h3wcPe9Is3tpI5CkZDapgFer8H7BIv3jUbwn9lIDKXCeszjtPmsZSkj40gmz/6DMounn3Q7BrBNwi8MPQn7Z+6CkBRTVIqRfK6VhK/K7PHcxLwxkLJcsvumC07tnYODMojYTu1orGX8w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788405338; c=relaxed/simple;
	bh=ORDPM3qqN5go9MYKtd30fqhdYxOpKkF7MOL7a5WUFP0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=a7BAGWRHMGgd2G3/Ss37jbY+wFcG/CcWe0uTeVELER3Kzk1EKxakgtjXDwTqYNJc/M/+sKcaWhrhFMovnLgXGm59c8Wl3jvYQ+tdG2XUJhfkQ2MxT+2YedDJTG/KFm2QlfJG8d0SU5jRitnHoCDkTPrQQ9D7DqC6vBk1B6PUnQw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fvHON15J; arc=fail smtp.client-ip=52.101.193.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fvHON15J"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A3mtPqFSWvXiUZim2UWYYGPvWIP0ompGukVVz/Agq5GGm6RzKjIniakvIgr1n8l9nKnGF55SPzbhksGw8nqKbJH6hgydsZoyhtYq6+TEPhX/soFXFEimHKcThdFCHlH+pMRUSj8gHL6n/zWrFeJFnyNWUt1T70EaeG/MDUMbNMhkz0jAb2FVtp5EsvSFWr0ZfiCiHX2K1pV/sSZHQDzK1UBjqz4F6Ktb791L0MQp7aNBj0tpVAe+iNmSdHFU0L9tLvbpYAogRlzsF7XJQ2FUClG2cL8LH9Ttw5bg7L01jW8rde4uNG/R7FOElXwVOs7rDKBe+At114LK0LpSYWEW7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qdWMgqDSFOq09fB5W3Swg+CqFxV/HlU2mEL/oM+HPFQ=;
 b=y8dEC3jfPQfdV5bScje6SKCKx96586w4mE9hY1VxIitGaP+sb3fXY+jf/m/T48Y6fbjlayi4CyCEUpPL6epgZpxfnZLbs74DNCQER5EPLbfCpzXPTsnNCykmCSyCLcoeMigOJqNRBggKCZtD+dys2nx1SDiYqnFec9fnkE2OlAcbZo8nUxa4+UQ4SBOfrCykuboxAumFWkkl5l6UR7URMQEkxyqLfqyaIzzsCg6JcC3GAke4XQKFicdgk5h3Qs5ZaWpPDy1jKvnfLegonmqFpUXadr2RYEkshel1ZbPP6uh/fi4Ic5F6IVkBAasPBnbPCKf910s2klZ69hIS66F9cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qdWMgqDSFOq09fB5W3Swg+CqFxV/HlU2mEL/oM+HPFQ=;
 b=fvHON15JMYAx6kdI1dyer3gQmZc0GtKChDW+cA8ZSPlc9eO/TNVwbrwTZKAwN9Y7SAsdGwvgmS4q0TOeGLyWEX8eJxJjaYNFfK4x0brl2cN/TFCG0GxkTy+CJjXbku0jvbJ7IiKvpd6WIJW3h6SM762RoEKCTIs9OclUCPiHh+VtY5/QR5V8+DTm7zJ2/If+KPSFNVcg7nKz/y5rfkzbCsht289vZjgqCGnohJXPW5Q6je1hzFFgl7jukJEfKSCkcL8yTr3i5wi0OK2h4pOLD9q65d+hbjNqJ69HOPTUfNiOSJDeytfUo0DxfgzcrpjsP023vL4/ug9NXgCjtD2UQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SJ2PR12MB9138.namprd12.prod.outlook.com (2603:10b6:a03:565::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.13; Thu, 3 Sep 2026 03:15:32 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 03:15:32 +0000
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
Subject: [PATCH v3 08/14] gpu: nova-core: log GSP events instead of discarding them
Date: Wed,  2 Sep 2026 20:15:07 -0700
Message-ID: <20260903031514.1515905-9-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260903031514.1515905-1-jhubbard@nvidia.com>
References: <20260903031514.1515905-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0135.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::20) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SJ2PR12MB9138:EE_
X-MS-Office365-Filtering-Correlation-Id: 386ebb82-0a57-4656-0169-08df09699a47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|18002099003|22082099003|56012099006|10067099003|6133799003|11063799006;
X-Microsoft-Antispam-Message-Info:
	DZ7Qo3dZHX2ezvJmH2OSPrGye4UN8/m0F/TayQJ5UntuVHslz+FRsc5HboEoBrFlfvv1XKk6LrpmU4ysTdWIA1bowd3xxYRc121UpOrZwSUtbH85T2b+KwyjeKXgB8CiXS7bIRDDTC7wxfkZpfuAdyFw6ZATjfS9SJ0jCYiJI61PJKINwma9/KPoXVHJfVeZZRj6nCdTN5MEKhgjE1oc7vdYOE6GkCN7aw1xY9vrcy4wstNSNWkZ0toijwvY0Z1i0ZwNhve/oeaB/nF5+YvxZjqgJ3fQ3eAEqULJyCShuaaJ4u+YTYedsB4wycZ/rkqyTidKTKGoxByMQ4jCuwKQdYWrSLWrRDyCHz2MxlJrRW/Vuyk+zOBC+Tw6/mnvMMGqGFuAKVmWnHjW10caELGSS2Rjp6BdHgnqmkm/uyHXg45NvHiCrE8pGznosXZ8Dzbeqw5muAfOodeEkRcr8HseRGUSfd+YNCp+A5zt+xWgZkH+XiwktOHVe6FrQPvsNf/Qg6TBAWTopnxrCVNlOo5tov5/qX96t9u+U32SGg0fL88HtgVLKbSKu7z2p6RlepAb8OcFfkHldtSA4bzmRk3f4luZmLFqMc3ZunBg0MvebrcVgwFsS3wsrLE+0PczKpglFKBXljn+DelBoWDa6wiR5ixAYczbQ+LaWz5Dnycsc1s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(18002099003)(22082099003)(56012099006)(10067099003)(6133799003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NTNt9cBxzr8rBfVWVsq3+i+xT9c1jh3vH3lc8dLgGfhjlK69nJYPkOJHDxEy?=
 =?us-ascii?Q?3/oL3ls2SokpZNTlCHcWtKJt1kDQwWXkTnZ54UCHyADkNCSCeetgbSsvpgvD?=
 =?us-ascii?Q?YTjXfa+I9ZG5ihlXwCRQNH6bgkYynyZAXUYeZqsuXd8Po7uZsr2Mlzfr2KeX?=
 =?us-ascii?Q?wVeJra/6xWxNMXWYZyjsTklc9J6kdl3hb2HUG3FJJFEOwd5FhZiNpAlX8rMM?=
 =?us-ascii?Q?z6HrukXHyHOoUSJRjT2zin5C+s8/yE2eQaLU+yzbrWjEgD4UQppFZXD92xDi?=
 =?us-ascii?Q?hWSK2CCruEk4x6B/taQDw96pKTL4R9mXNHla2XKyVjihaKveQNYSkQcmoklQ?=
 =?us-ascii?Q?GGanrwzCQp8SgZbOf1ojPLoHBTDqmn12SXT+ZO4F6fL647U7SewopsnT7u/m?=
 =?us-ascii?Q?+oGWkRfJBz4IZv/FLKKSq3Hp4epdU5eenM5z9AWUfjcIHg2T376+QNCkOfaf?=
 =?us-ascii?Q?PtlXG1qLNh09GVMuWTqjSZcQUzy/DcOAG7zFzS6Q6FZJMpDssdowoQ2N44Oi?=
 =?us-ascii?Q?J7LYf+kfqiwz1qNdxMjdI+G4vbwxs7ZmFldJQGo82OWMn6TLuNOyxnjRx5oY?=
 =?us-ascii?Q?czmKUu4XNNGYTDGrXaSznKaF+Po7a8cBY1YvzrbS7dNHsLzlDA8axepucZnR?=
 =?us-ascii?Q?wOmFZD7JzsvnxVH3+c+hjnJQoQpjfy/pBlgj3m1m86Svth1v0MEChHgs9SYf?=
 =?us-ascii?Q?+WNuDqVbvedGOIg3Fr3G0qw2olKM4XTDAECV2QqNjBhN/D1V5FIT8eBC4IPu?=
 =?us-ascii?Q?hOXWFrtJRTM2+F66HzHj46NXBE8qKhL/AZColxZWRgYBQfDHCLH9psja7xAL?=
 =?us-ascii?Q?wMbUxBDTOMBs1QfWwlYk0+KFiIyvRB5lgpm9W6VnKqv5AGP2iQ9G+/Y2C1Kx?=
 =?us-ascii?Q?XJhMU9msmCX/bjSjC6JPq5ioCrGFB5xTMwFLtKsMI6Hy6HKeF1qaZ6ZT3NNx?=
 =?us-ascii?Q?I1jrbc8V3nFDZJQyAIfGjFW+rnnZN7+V002PqIQZ6Xh0adDS11mMvtHSbIcT?=
 =?us-ascii?Q?5wCuivKJjgdeMCxtjRdIqfQ2/Bjcro2ueAF4J0Rs+xGCboMU8DItfg5898qQ?=
 =?us-ascii?Q?zd8r5Y0vyfCnXV10nbPI/Z2H+ZZMg4keDZXLxc9Q8OqLKqdlkzrYBMA7jirS?=
 =?us-ascii?Q?1O47AXCVirld1IIi056xIB5UYlSarNre7woj96e33Vk9xGS29igXu36Xttrd?=
 =?us-ascii?Q?YduBuGjB+2WnpDsDBeNjR6YP3RmUGcjNNxJXpqiYYQFVh41+f71l3jFVjMBa?=
 =?us-ascii?Q?RVu6nzPxHSFtm2y/O9AYyKCc3fm0l7gKhX4rsuAfE1lBfat4Z555Myk7XkrC?=
 =?us-ascii?Q?/PSMXnRSYZEwOrmWrkfG1xMlD8xIP4D3eKlf37Y2mvCGC0wwUyBs99M/JHHh?=
 =?us-ascii?Q?bermLL3UYNZi4qCNlBhE5vqv+tHeWUcGLGMmxxBfVBbi84Snfx+xRAiY4Kdc?=
 =?us-ascii?Q?RxnTzDVl9jBQ2S7fgdX1p2tbMVEtgmFCZ/f5rebp8MxZ6wRlGXi0otjmRlsk?=
 =?us-ascii?Q?VcbxMBm79khepk7bUQHr0XMcv9Hs7oJgW54UFVA4UsYNlGtGLn9cVY2aaLDN?=
 =?us-ascii?Q?0Ipwj+o98d1mT3KvfC998S2ne4zj46hpW16AIhi4evFlu0xWqPg2xg5ic9Gp?=
 =?us-ascii?Q?l4Ls20PjWAJqfgUO9nu6DaJl2jvBiBejPhGQRzwx3OCw6q5N1ZnDux9gInDN?=
 =?us-ascii?Q?d0OnSPSc8S1vR3tLOYuWa4Jk8SibhwFK4Uhe0vQdhFB+7D8eFNK5jBAIjCMJ?=
 =?us-ascii?Q?zMSOcfdE8g=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 386ebb82-0a57-4656-0169-08df09699a47
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 03:15:27.5851
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BkfKkKJi6eXg7F8gz+3pDC6/LqXZ3Ep2Z6YdrCGm5dEhuRgfhe7alazhYNP3M3pg/Bi2a3SXgOy2CjpwDWHIeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9138

The GSP posts unsolicited messages onto the same queue that carries
command replies: logs, OS error and robust-channel records, and
lifecycle notices.

Anything that was not the reply a caller awaited was discarded, and an
unrecognized function code aborted the in-flight command, so the GSP's
error reports never reached the log.

Log every non-reply message according to its function code, and leave
the in-flight command waiting for its reply. The logging runs on the
existing command and wait loops, so events reach the log during normal
operation before any interrupt exists. Event payloads, such as XID
numbers and log contents, are not decoded.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 58 +++++++++++++++++++++++++------
 1 file changed, 47 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 14a711307654..5572224db233 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -556,8 +556,8 @@ fn notify_gsp(bar: Bar0<'_>) {
 
     /// Sends `command` to the GSP and waits for the reply.
     ///
-    /// Messages with non-matching function codes are silently consumed until the expected reply
-    /// arrives.
+    /// A message read while waiting that is not the reply is logged if it is an error record, and
+    /// ignored otherwise.
     ///
     /// The queue is locked for the entire send+receive cycle to ensure that no other command can
     /// be interleaved.
@@ -814,8 +814,10 @@ fn wait_for_msg(&self, timeout: Delta) -> Result<GspMessage<'_>> {
 
     /// Receive a message from the GSP.
     ///
-    /// The expected message type is specified using the `M` generic parameter. If the pending
-    /// message has a different function code, `ERANGE` is returned and the message is consumed.
+    /// The expected message type is specified using the `M` generic parameter. A message whose
+    /// function code matches is decoded and returned. Any other message, whether its function code
+    /// is a different one or is unrecognized, goes to [`Self::classify_event`] and `ERANGE` is
+    /// returned.
     ///
     /// The read pointer is always advanced past the message, regardless of whether it matched.
     ///
@@ -824,8 +826,7 @@ fn wait_for_msg(&self, timeout: Delta) -> Result<GspMessage<'_>> {
     /// - `ETIMEDOUT` if `timeout` has elapsed before any message becomes available.
     /// - `EIO` if there was some inconsistency (e.g. message shorter than advertised) on the
     ///   message queue.
-    /// - `EINVAL` if the function code of the message was not recognized.
-    /// - `ERANGE` if the message had a recognized but non-matching function code.
+    /// - `ERANGE` if the message was not the awaited reply.
     ///
     /// Error codes returned by [`MessageFromGsp::read`] are propagated as-is.
     fn receive_msg<M: MessageFromGsp>(&mut self, timeout: Delta) -> Result<M>
@@ -834,11 +835,12 @@ fn receive_msg<M: MessageFromGsp>(&mut self, timeout: Delta) -> Result<M>
         Error: From<M::InitError>,
     {
         let message = self.wait_for_msg(timeout)?;
-        let function = message.header.function().map_err(|_| EINVAL)?;
+        let function = message.header.function();
+        let seq = message.header.sequence();
 
-        // Extract the message. Store the result as we want to advance the read pointer even in
-        // case of failure.
-        let result = if function == M::FUNCTION {
+        // Bind the result rather than returning early. The read pointer must advance past this
+        // message on every path.
+        let result = if matches!(function, Ok(f) if f == M::FUNCTION) {
             let (cmd, contents_1) = M::Message::from_bytes_prefix(message.contents.0).ok_or(EIO)?;
             let mut sbuffer = SBufferIter::new_reader([contents_1, message.contents.1]);
 
@@ -849,11 +851,13 @@ fn receive_msg<M: MessageFromGsp>(&mut self, timeout: Delta) -> Result<M>
                         dev_warn!(
                             &self.dev,
                             "GSP message {:?} has unprocessed data\n",
-                            function
+                            M::FUNCTION
                         );
                     }
                 })
         } else {
+            self.classify_event(function, seq);
+
             Err(ERANGE)
         };
 
@@ -864,4 +868,36 @@ fn receive_msg<M: MessageFromGsp>(&mut self, timeout: Delta) -> Result<M>
 
         result
     }
+
+    /// Logs a GSP message that is not the reply a caller is waiting for, according to what its
+    /// function code reports.
+    ///
+    /// GSP-reported errors are logged at error level and unrecognized function codes at warning
+    /// level. Every other known function code is consumed without a log line, because the RPC
+    /// receive trace in [`Self::wait_for_msg`] already records its arrival.
+    fn classify_event(&self, function: Result<MsgFunction, u32>, seq: u32) {
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
+            // GSP logs, libos prints, NoCat assertion records, and the other known event codes.
+            // None of them requires action.
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

