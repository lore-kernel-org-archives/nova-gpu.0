Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012064.outbound.protection.outlook.com [52.101.53.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142CA38B12F
	for <nova-gpu@lists.linux.dev>; Sat,  8 Aug 2026 03:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786158711; cv=fail; b=lij7H/S4mhJe/WbSLcuVRozzAt0zlBFoDffvhxkbZfG0Qb1m02QMbRjJ5f+xveF9FJTxueSKTf3yuk7/JayfqbziviipEYyI79nhACN7CT/8lHuGApM412FHFjjp/ULE8zPjWolYXr+YIljHBINKhNBKFgnH7gpXQUmmzaM6SC0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786158711; c=relaxed/simple;
	bh=3CeLMBPZmxuRg51AqB4jsGXZfAyw9ThhLPbdWhV6nyA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=McpAfxNGHclsS2SXBoGwl3dRrR6HPkS31A7IhJ204QcOrXPqLsba25KwjcZraVxEDQHPO91mXZf9nsG7ipFMj+Eq51rOwc+wEskO9Lv8EN+r5rE3RfSi5o4BDnWrCXqY+hidA2b7595f0G9Ag/p0ttPZ3ZL/4F4zAutctGh18b8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qVBbqdB5; arc=fail smtp.client-ip=52.101.53.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qVBbqdB5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LMmZUFXyhzVOGlwChCbjyqTcXOAa7oyzskU2WWokGXI2ejswW6i82lgpRLv/chxr/O1A7ys2E19G+ilYD/XkX+xiqirGD7ehA0lA2/xkqeIAF0EjwgOMXB1qY7COmVQQw1slWEkdG960MAmvyXDSDJpu5325C5i3je6lZ8l02HCjex0VmTqSKg+yMN+UctrDTgyGw49tx9CEfHvaaffVOgNXUnIYTR3ADmk/2Rh7W4zFzhUMnRj9YJF44hQDIt4Esi3EqsV6HjQL0Zs7PVnloI1mFTvV6v9O/DZw9gunOYXggLj8aB0krG6HIXPM/OgqjeURJIEnxrmMYa+p5e9lJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w8aoowABUSYK/7YfMaZ7uWcOpXQNcL1ywTtScIJ6bSk=;
 b=YKQkA63uxLqqcFGTeVV1oEHBm4AddMPXsmlvpHcrh3BsHbaOVY5XDmO+HJMv5lbluDp9LlGIR2+ijZAmijxWwv6FUAqeVZQP1xHkk5+84w6dF473sXmmSj+e6qVoHjqabG1031aGLa9eP5q4eEke8KsuNxtL0wKBoq2CbUJKaRk5Hy0rHW/WSgxkQKmhC4+4uglN9XBaCI4Mo8vJKF0vJYOqlgxy+Tutif2TleiCF9xbIumkilIDPNLb1T6EJJhM+o0QwPKneIOIwIGe5SeLp1bLCABW7ny0f22NXJjMaopWQcQnnzNOgjEyknyPmKq++krR6OW0ETi3/Dve2lzdkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w8aoowABUSYK/7YfMaZ7uWcOpXQNcL1ywTtScIJ6bSk=;
 b=qVBbqdB5TWgu4sW9rFuZMMuqElSMoh/SVqKUUVMksQ3F5TqhmQx+WH2GMaUfsYYFcFd8I1RZbHxL6L1hRzb72hO5ERSRAthibn0Q8XAEKx+q8L1xuvIstRtu07wRNYfuOrkvPE48zepAT4+30ZcGk4+naxSZwYAhtFyerS2YCV1E10PXFCQtyHnAnfNJQJv9UZcOgJFCW+8xIB4lmGKyIf3Tf5rqQjxcwOzvJJgATX9TfWK9WqTbou6NTTTB8Ce+rHAMeeqnf1yR4uXuTUs1oRkemMxv13LtVSZHabE4QIr42+hHi8DIpXLvDNPgAq6M3JPdUWcUG2SuoNguUUeQeg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CH2PR12MB4198.namprd12.prod.outlook.com (2603:10b6:610:7e::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.21; Sat, 8 Aug 2026 03:11:38 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0292.022; Sat, 8 Aug 2026
 03:11:38 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Joel Fernandes <joel@joelfernandes.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Cc: Timur Tabi <ttabi@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Shashank Sharma <shashanks@nvidia.com>,
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
Subject: [PATCH 13/17] gpu: nova-core: bound a GSP wait by a single deadline
Date: Fri,  7 Aug 2026 20:11:15 -0700
Message-ID: <20260808031120.363869-14-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260808031120.363869-1-jhubbard@nvidia.com>
References: <20260808031120.363869-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0P220CA0015.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::19) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CH2PR12MB4198:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fd90b7b-c1b7-462d-eaaf-08def4fac2f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|7416014|10067099003|6133799003|56012099006|11063799006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	1h5sghRgAb7dNS1EM8qrDOXTW2WExBgKBH6AW6uzRTUYi1iGdSnU854pcOJ2Jdhn7Zafgw4lD1PTHhEXzu09nhA9a25lbJ0UgPCL6ibf6JOnufDCoxxSw538Xdr2XLHam1NF/5a/w2VlscqKsYnAgHeZPw38sKOdGeqfYNNr4lhoQVIPxmuiu+wGlBrdzUygtQhL4N4l2+FzDWoe2n7VdVYAjvR3ta20++azZSl7lXipfjQ7SiXq83ARG5xhPZw6ZgksWVbscUJZpFo7d394P3VHMIToXOU6kDn3+XbN3TxhIY9pjhg3YYk7c6e+rl9s1RsAEXZkgo6sswMdKCapHAIPcU6GrRTzOxa4B7BWdPC3DFCKxCgnzS+DKpbzrwv9uq76VGHDBoV2QqNwuxgeqTdP0E0rajI3iQb56XzRsaYf4rrCig/Sw1zsUuyRHFYoVuQFUDuXHT6wXMhFDsmREwbGmDYTmE3XkEa2MEO35fagOj1Zm+aahEiQ2E/8fZfYbWgkvlXIzt/HBscrTYNDpdPp7G1NgIby45NnOGjFc/Gl+sVW6OoiwJWyhCK7AUI8WT2c/TjzB2dgHvkmIBeCEXkq0mPSEWweCEJaT0KBCoya8tflnemTS9wkNgl8Xg73s+M4R1X9e3/y2x/Fa/LTMtY5ZKXRYKNXt0LQ5gNpffw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(7416014)(10067099003)(6133799003)(56012099006)(11063799006)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ebO9hx8qzDInn4TUN4EniFBRy28UcSE125VVcB/N1xl0syIQpUvyaRIMkmaV?=
 =?us-ascii?Q?WxGrLj3ucKDvqsPVFtSr1KqFcnBJ3xs65g+4kPDQVfHF77iK6Ub9fy2kILGy?=
 =?us-ascii?Q?T2mJYpPgCTH3tQtsa+nn0++IvN376EQNlCLqLUQWtrYrmT9yLYVtwYacUHse?=
 =?us-ascii?Q?QxazlaGkURWPXa7mQyABkWqjRhhcu/Mm3hXIzBURJG5rBDLLwqwEEg4UPEul?=
 =?us-ascii?Q?OYz3sPgPeHPpGgVNH2zKWGH2MvS42fx+V8ajBZN+Cbxct/YvrSTxFasJx0/z?=
 =?us-ascii?Q?x4pYQCZx0QIbbIuUM2AcuK68Wv7J0b8ZmQefru3RTVAPU6fyY3MT78JTnriz?=
 =?us-ascii?Q?3X2//Rm1tQaqpO24ubPA8EN8hhzD83eLIiq5/aly3T+DuQ56d8zX1w2Y7Hbo?=
 =?us-ascii?Q?UdJYyNJlVDp3GvSfRf7CTXhaaYQGNk/XQQKoLjkH6w5Tr5+lbaQYVgNn016k?=
 =?us-ascii?Q?b0iN5DfmkF0XOJRRMAUx8qEIqindDIqWA4NQwBhiQeGkzDGvxihMfJhepFXu?=
 =?us-ascii?Q?mp8Nzcbms3hj6QfqxJgVIwLgYnKTfbxLgXzZntsBoXEU3M7nImgK3YUx46Ix?=
 =?us-ascii?Q?Hi/CqOJZ6A2rU+AUQjhcCCfb6cn3z/GSRqDhGiJf6DsAJZFBCR3XPCCn+di/?=
 =?us-ascii?Q?ji962R/meB9N8Diw3eBZFgiH0ln3iFL348mG7vg6Bxty/3v1K2nnP6be4Foe?=
 =?us-ascii?Q?ZzDx0hqmY1HOGtaE8LBStoPPMZxmDSppjflWdJQHvAqHE4pjYirwkVHL4ssn?=
 =?us-ascii?Q?ts1Gd7FVSVU/InHak2oBnAOThQcs4FLrnlRUIeCScgPqerquGQzvgSHYAYUk?=
 =?us-ascii?Q?0Oqs8eHNagScTH+mAoB+ZGiBQFQnaIf++mJqo9K8lDNPtF3T2naHE3uipYdA?=
 =?us-ascii?Q?P4zpEYMW8b5TTFXgESzYTGPF1UuWB0hm9TRFzEvc2U5RQEPrrnREzNgf/33r?=
 =?us-ascii?Q?mdzq2RB65VYJoQ5OX1z5czenSlHuW2ORNEZk3vOTSzFqswfCguNPwbFqQfkI?=
 =?us-ascii?Q?BmYUh82LsilsgVXVAIUC+/EnBNxNQhP5g4gcdqGZ46Z8ksLgV8Wro4i73pea?=
 =?us-ascii?Q?KzPIjimHHVK83nkJlWEX1zK+h+oc6xxc5/2rIcf/LUJncdfbKgFApVRffAVU?=
 =?us-ascii?Q?qtJpl2Yh+Wg0CeZfnEr5tlN2YuDn2P7vMmfFPULpYzN8z6kmIoCfCJHdpkDm?=
 =?us-ascii?Q?xvMCdXoL0cECT+dbDaesUoykydtiEAmVQ0vzrvlkqM9wDpC3Mp6Iu3Vh5bRW?=
 =?us-ascii?Q?Sd6EAYZuBqUJZL+G95zXqE5SOa8JFsD7CsetVyNQsQn8Qc//+w/zF3s3BCX3?=
 =?us-ascii?Q?Ko8ncKx24hFBD538qS+14ZQN6Hgab+AFUBA4eCMqrQBmBOadKbZi9EKCl2Sg?=
 =?us-ascii?Q?VBcnXp78gAIOhKI9T2a0Kl3txuXq6gWSLqgFpL04ezufY9p/q0O4fs1d0qRK?=
 =?us-ascii?Q?zyzbHmQbBLGOgcddgZW06wUMBxaVUsIRlke1jdEfMscLUXE1gXHUjWdfBpZI?=
 =?us-ascii?Q?snXdZuCXXZojGNAI9VjWN20OGVDuORMFQpecssa5A/jYw+CERxJt0E2jj3Yr?=
 =?us-ascii?Q?VXgnlG1b6TKK4Y3pr9h8psHejbwOm6xQCsH3JQGk9orWc5z+FGUfVAp7+Dfr?=
 =?us-ascii?Q?Ue6LM/3UwsfozBqFekI+bm7xqLMEVRJDQiAtsi8Wp6R0G5fWyJi7TdbnXYRK?=
 =?us-ascii?Q?G0joJ/0Igbjw7KNmzL+nNXSihJnEbaRu6fsfvsjpP3h0qui8pysS7SSG+FrX?=
 =?us-ascii?Q?/huuhFjcLg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fd90b7b-c1b7-462d-eaaf-08def4fac2f2
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2026 03:11:38.4466
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KzwzAqsIs0mAaEm9ShXZzk93iZh33peY85jcBgExgBytri7TRlYOV929Bbz/I1eFFP4q3hffyZQla2ver50T7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4198

The GSP posts unsolicited events on the same queue it posts replies on,
so a caller waiting for one message dispatches whatever else arrives
first and reads again.

Each of those reads started a fresh five-second timeout, so a steady
stream of events extended the wait without bound.

Compute one absolute deadline when the wait begins and pass the time
remaining to each read, so the whole wait is bounded however many events
arrive first.

GSP boot waits for two unsolicited events. Move that loop into a helper
so both take the same bound.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs      | 52 ++++++++++++++++++++++----
 drivers/gpu/nova-core/gsp/commands.rs  |  8 +---
 drivers/gpu/nova-core/gsp/sequencer.rs |  8 +---
 3 files changed, 46 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index fc4c229b8b9a..76d51155c49f 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -30,7 +30,11 @@
         aref::ARef,
         Mutex, //
     },
-    time::Delta,
+    time::{
+        Delta,
+        Instant,
+        Monotonic, //
+    },
     transmute::{
         AsBytes,
         FromBytes, //
@@ -558,8 +562,9 @@ fn notify_gsp(bar: Bar0<'_>) {
     ///
     /// # Errors
     ///
-    /// - `ETIMEDOUT` if space does not become available to send the command, or if the reply is
-    ///   not received within the timeout.
+    /// - `ETIMEDOUT` if space does not become available to send the command, or if the reply does
+    ///   not arrive within [`Self::RECEIVE_TIMEOUT`] of the send, however many events are
+    ///   dispatched while waiting.
     /// - `EIO` if the variable payload requested by the command has not been entirely
     ///   written to by its [`CommandToGsp::init_variable_payload`] method.
     ///
@@ -574,8 +579,13 @@ pub(crate) fn send_command<M>(&self, bar: Bar0<'_>, command: M) -> Result<M::Rep
         let mut inner = self.inner.lock();
         let expected_seq = inner.send_command(bar, command)?;
 
+        let deadline = Instant::<Monotonic>::now() + Self::RECEIVE_TIMEOUT;
         loop {
-            match inner.receive_msg::<M::Reply>(Self::RECEIVE_TIMEOUT, Some(expected_seq)) {
+            let remaining = deadline - Instant::<Monotonic>::now();
+            if remaining.is_negative() {
+                break Err(ETIMEDOUT);
+            }
+            match inner.receive_msg::<M::Reply>(remaining, Some(expected_seq)) {
                 Ok(reply) => break Ok(reply),
                 Err(ERANGE) => continue,
                 Err(e) => break Err(e),
@@ -600,17 +610,43 @@ pub(crate) fn send_command_no_wait<M>(&self, bar: Bar0<'_>, command: M) -> Resul
         self.inner.lock().send_command(bar, command).map(|_| ())
     }
 
-    /// Receive a message from the GSP.
+    /// Receive a message from the GSP, matching on the function code alone.
     ///
-    /// Matches on the function code alone, for a caller awaiting an unsolicited GSP event rather
-    /// than a reply to a command. See [`CmdqInner::receive_msg`].
-    pub(crate) fn receive_msg<M: MessageFromGsp>(&self, timeout: Delta) -> Result<M>
+    /// Returns `ERANGE` if the message that arrives is not of type `M`. See
+    /// [`CmdqInner::receive_msg`].
+    fn receive_msg<M: MessageFromGsp>(&self, timeout: Delta) -> Result<M>
     where
         // This allows all error types, including `Infallible`, to be used for `M::InitError`.
         Error: From<M::InitError>,
     {
         self.inner.lock().receive_msg(timeout, None)
     }
+
+    /// Waits for an unsolicited GSP event of type `M`, dispatching any other event that arrives
+    /// first.
+    ///
+    /// # Errors
+    ///
+    /// - `ETIMEDOUT` if the event does not arrive within [`Self::RECEIVE_TIMEOUT`] of the call,
+    ///   however many other events are dispatched while waiting.
+    pub(crate) fn await_msg<M: MessageFromGsp>(&self) -> Result<M>
+    where
+        // This allows all error types, including `Infallible`, to be used for `M::InitError`.
+        Error: From<M::InitError>,
+    {
+        let deadline = Instant::<Monotonic>::now() + Self::RECEIVE_TIMEOUT;
+        loop {
+            let remaining = deadline - Instant::<Monotonic>::now();
+            if remaining.is_negative() {
+                break Err(ETIMEDOUT);
+            }
+            match self.receive_msg::<M>(remaining) {
+                Ok(msg) => break Ok(msg),
+                Err(ERANGE) => continue,
+                Err(e) => break Err(e),
+            }
+        }
+    }
 }
 
 /// Inner mutex protected state of [`Cmdq`].
diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index ffc25fd8c47b..61fe93db9e7e 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -188,13 +188,7 @@ fn read(
 
 /// Waits for GSP initialization to complete.
 pub(crate) fn wait_gsp_init_done(cmdq: &Cmdq) -> Result {
-    loop {
-        match cmdq.receive_msg::<GspInitDone>(Cmdq::RECEIVE_TIMEOUT) {
-            Ok(_) => break Ok(()),
-            Err(ERANGE) => continue,
-            Err(e) => break Err(e),
-        }
-    }
+    cmdq.await_msg::<GspInitDone>().map(|_| ())
 }
 
 /// The `GetGspStaticInfo` command.
diff --git a/drivers/gpu/nova-core/gsp/sequencer.rs b/drivers/gpu/nova-core/gsp/sequencer.rs
index bcad1421953a..e2f1da129d8f 100644
--- a/drivers/gpu/nova-core/gsp/sequencer.rs
+++ b/drivers/gpu/nova-core/gsp/sequencer.rs
@@ -343,13 +343,7 @@ pub(crate) fn run(
         libos: &'a Coherent<[LibosMemoryRegionInitArgument]>,
         bootloader_app_version: u32,
     ) -> Result {
-        let seq_info = loop {
-            match cmdq.receive_msg::<GspSequence>(Cmdq::RECEIVE_TIMEOUT) {
-                Ok(seq_info) => break seq_info,
-                Err(ERANGE) => continue,
-                Err(e) => return Err(e),
-            }
-        };
+        let seq_info = cmdq.await_msg::<GspSequence>()?;
 
         let sequencer = GspSequencer {
             bar: ctx.bar,
-- 
2.55.0

