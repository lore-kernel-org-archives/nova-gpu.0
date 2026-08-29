Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010029.outbound.protection.outlook.com [52.101.201.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A23D3A3816
	for <nova-gpu@lists.linux.dev>; Sat, 29 Aug 2026 01:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787967228; cv=fail; b=brr/nbBxqJ2oq+udhDg+hOtnBfjdWsQNJ3bXNwhyN0W29gbEWykWvO2jnPbDcMZnwWJNEaKiWO0PX6WgbWM/NlMbblVYxXnMMQY2pN+omWUQ5Au+06nCnPfd2+K6+DNiLdvrDMbx6/gHUApzIaLOFc8biYD2cmbVXZN//03VVbc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787967228; c=relaxed/simple;
	bh=3CeLMBPZmxuRg51AqB4jsGXZfAyw9ThhLPbdWhV6nyA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UhOAfpFQuXeDn0mxCGmTKBaKvQogRXSdc1GqtxYRpKYlohEp/aq5XbdITwAtinRzpt1sPNcVPI1DEfQboRIEbLzaP3CcqonRqPN8hFxf8GBSv8g+zpPXrR9IJZc7rIbtNPzsKYjSjzoVCHzNX1UgWTlnPzK7UDBYZpB2xU0gttc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=j9oiLiul; arc=fail smtp.client-ip=52.101.201.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="j9oiLiul"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=drpHNtb9OcgHXoD6rprSwWHCVX9FSO/laaDm1SPSr6UreeDhaxM46gPd9keioEaR3dB14wbZFlPPlVXSAYNMWjXwI4yxIlYGujFiUNX0BAU8xONhtvegvffg3I4ldTXSI0XfDwJiwQHcwzkYH0s4Kw4Owb/MPsrfxmgVc71hZMX3Fvx4T8Bu98Vm1Zng+XGhvnFNuyl09jpedxOozPyORZWOG0o4O7IjbG8hw7nP7FX42MBidR9A4c+L/a8I7yCx3Cv2/TlyJR04XUbj6JH4H9l7U4h/O/gQkFrWs9WhoJ9OImLREftcnIXZmFNPEOvdVoANrgfZztGr2L4Nz2LPew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w8aoowABUSYK/7YfMaZ7uWcOpXQNcL1ywTtScIJ6bSk=;
 b=lJl0c/iAVo3rv6ttJaQcB8/PE91/BPFdvMrlJ8NiI72Bf9aoDpKi9tbKY+jEI+4A/HDLUI8i+904CZpK/aW6jebvi6plLHYnP8eOEoJ0yvy5LqHeRsuzTsjL4OSXEAWoPC2ThkCsVgGOY5cpJze3obTKSTHkZfHh3DOpWupnpafjyVvsE9GD4K+grmcC0eO27FhE+JmaQTst7jJp0oHUy93zncHEKogqXHGLMxqASQOMmDo4PgoYI/6+aoV5W3/yhrAs+IEJnUsxEu1XZPjjwvo56cIeC4vRMT0HBffzyuWeCRMpc1TSbCWd/B7087bJGr+RN4xjM8Novsxa7j6ovg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w8aoowABUSYK/7YfMaZ7uWcOpXQNcL1ywTtScIJ6bSk=;
 b=j9oiLiulYTCGhBmAJ7gm73nFQ+EuhaI4zmwm/gbfAFxT/cvsgI8xUL1m7zm9rm11fP6C4dpmvpKDxLEtO1R/UJu68o4Ma5NV7OT7JqAOfQoa3tkgMXXvL55kNW1BtSpYz85yTw+NCxIRmSQWlOnGxXasri4NfkvDIjiM0ag4GeDKlHuQjkY2BdBqLsGddETMnh8c7GqhvFE661lEv3iGKMB1wJGS2njSjb5T4A7rzSh1XHu0aApiaBnw6zMyEVHvAavNzGN1Qk2r5zgtWz6yOy82hrMWaIP6MHbnEURzLsfasWTHCKqMrdQVV5KqmIx4Mw2ol3RWgMNDbItvRQz/xg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SAVPR12MB999121.namprd12.prod.outlook.com (2603:10b6:806:4e7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Sat, 29 Aug
 2026 01:33:37 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0360.008; Sat, 29 Aug 2026
 01:33:37 +0000
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
Subject: [PATCH v2 11/15] gpu: nova-core: bound a GSP wait by a single deadline
Date: Fri, 28 Aug 2026 18:33:30 -0700
Message-ID: <20260829013324.499542-16-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260829012243.496697-1-jhubbard@nvidia.com>
References: <20260829012243.496697-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR04CA0001.namprd04.prod.outlook.com
 (2603:10b6:a03:217::6) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SAVPR12MB999121:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c071fff-6cf3-4290-6d2e-08df056d8c2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|6133799003|3023799007|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	at/8cIq5eOS2HayMZ8JPYFLaFn+BosJWVaI9Pvi3p+7fHIudFrpPsOMII6srohL+yTf4d6gWg8QsL6jNBiY5eOEoOx4v/ZdxaBSedUgVwqQQgXtMO/XaeP3PZc3mtKUP+olHOgneueB9yN9Zv1UxRI5zpCc2fOIRCLdEOz/Y70SWAWVEhieh/hTTkFIYSJuvKctk07rN5Q9qNX2z54JjWjTo+oxP4PCCf714URdz6hGU9F8QdHKaffKA+QpAO/cMH9X+7zY+BHjI7c9mWZlrKkA+LaRjquduSCeKXya3Fpx2mDGQQRzmWgJY49+ybOz+GYnGCSbtraB5tfg5Ss5NcJ9RetWZFJA/zkC1GgS7lsl/0XE7MPRTvrg/BBuF0hGIPOdEc1qTMFab3tRi8wPGARtZHywG3wbwrSxEEnHwNsENKYeljs3wZMMatuaZuw0HgA4jM/7kbcWsWdY4vxhR6d8TP2z5tL6GIAhGQICUOngMfag8jJe985MX8jMYeNHyIIcVkwfX2TvA9fakA9xFRFpCYTO7awm10/itE2hWfIgFeQukQ0SsewaIQJ1QxXz2v9pqbhVaY02W5zCjNYKOVrYRsqgZ4xV0j3N3ioRQCkcxSV8KvyqZUegumDCsdIJVfgkQ6fD/SyK3qp0IzckSvU2AAGgoRLLTHRPeu1QUB+I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(6133799003)(3023799007)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?a6oJ9jHaGoxVI6oUXoEyVylAwtvncaXO73Sl/SRLEQ+ECGAMY5zy2B+lgo2s?=
 =?us-ascii?Q?Ur2NsHjLbMy2898QPPqV7fvlELWJJHX72iKCzzey61c4Gbv1wZccB/ac2WVj?=
 =?us-ascii?Q?O40CTd9xpmVckvEx4X3OsRaX4uLxoIbHuWSMu2BolpCnoa0oMrpfjFHSUK/Y?=
 =?us-ascii?Q?R7di6c5Z+LG6wAl3magWgMt6kJ0hx9WtO1ZCf81UWd6awMv2d/NNxotaA9nc?=
 =?us-ascii?Q?yQbvgz82yfEqkNvZeWcME3+bQeNOpeI12BTkCoXx+LybWKZaHHaLflmeZtqR?=
 =?us-ascii?Q?Kdqb0huu7TBgBK8cfxaoywj0epmXasy5ke0PZ16U48JmVdpaCqaR2ix2Xljp?=
 =?us-ascii?Q?PoC6eWOwxw9XXZH+MPVTJtVRYt4RZlqEZDOb8k7KDYDYDBzauHzTKg0BH8Qw?=
 =?us-ascii?Q?5wuIaqeHxh8uDvGBqv++9jjAPphG+wEiUPjpOVwpW9/knpa5c51IY+dPCAII?=
 =?us-ascii?Q?GJhrBBYz3QM+kfHEXNPhKI3LZFSReNPbUBIfRakn7EAk3FOaVu07pHgpvwI7?=
 =?us-ascii?Q?BFdRAN2ij0RxhqwIxY2khyxF6fJbEgpumJxV/dz85V/uh1Y3kY2edv/2O64d?=
 =?us-ascii?Q?z3bjDeMMMN6fdm8XsqSLzX+e0xXblsSRYlK6N3erxOIx+iuXi0DB5OlZFSej?=
 =?us-ascii?Q?u5wgk5BKFdCWQPess3dxsp7qp4V0S7Koilx7yUKwYITGNdrA/ONOJTmlXq6t?=
 =?us-ascii?Q?yknb1X0aEahnoABAXa/ddzqWfdn4S0jDXqpP0GmTsuLirwhOIINm3oiTUWPA?=
 =?us-ascii?Q?s3mMXDJE1BW9e9qq010Qa3z6dq3v3EAm93BNANWW0j7n15Y36Gp774RPysV+?=
 =?us-ascii?Q?uQFkLS6SvRT70393AfL2qfNjActjiZnWSJvI0Mqs+BJWLE3f2SPqwveI3PG8?=
 =?us-ascii?Q?0lR8y2IZUQ1+lVirQuDmCogJ/ep1N6HFQHg/3QgRYWGrMK9zLaxBOyrcAtnQ?=
 =?us-ascii?Q?Yz+2ZO/bhselZg1NIkWXDkD8unXORjcP4Yv7WNowzqpJ2bbcFQI0Py7KBjbU?=
 =?us-ascii?Q?nL2rkOxbgu86sddNS/PW9gepAoRRAFZFMBBc8JIo5QBYMRw4XZ3vMMJF25YH?=
 =?us-ascii?Q?VX3X7mtXpdwJDAvhPZjIS1e1WhgSn6tdEdUG8PR3sORcO1FABoPmkSCkDIdL?=
 =?us-ascii?Q?+HqUOl/ELC6NaG/nLxpMfco2IKGlLlnDu4OJCMIamzg7tXvRy9h3u3lnfI3i?=
 =?us-ascii?Q?pjmrBtR9jPvws6bzqxrkvlaviltgw6gASPidzt94LPqggudY4kB8QfiorSr8?=
 =?us-ascii?Q?0fq4EnPuK5RcG/qEmD/tz2HspCrjZ9rGZjCFTOGtKRUjKkGWcRZZKNh+Al+I?=
 =?us-ascii?Q?J4y2LtvHDk9EQj9O5EfqtfgAQMe8ENZr3tuUHV9n9TBs+kwNhBnhcNLiwvLB?=
 =?us-ascii?Q?31YSwaZWhYYjvGv7M5WzmtF/1Vy+lgs69BM9hULWL3z5YDi1qYOuiqPpzB/E?=
 =?us-ascii?Q?2BNzqAuEC4xZ0qCDaNfBQndrJA5W1knSTh1JU6jWMjegRjcn0KOdojPtV9qi?=
 =?us-ascii?Q?JhnxT//xwh2fPa87YLXR4PAtxB9bL3Aw63+Ogcp8AZqc6v3VzN8SXzZ9SfXb?=
 =?us-ascii?Q?avdMv9XE6szU0Dy9vfE6plukjgvypz38pQZbTGBoRbvRtJt9SowTHpkBH6zh?=
 =?us-ascii?Q?C70Xxv39L1nMb/V+5g297Ak0k0ugu3jIk/FCpk9NRmMv3DcEQu3Hepa2QKZY?=
 =?us-ascii?Q?CbXJ17Oe0n0PXRHOYgjXy4f+OUlWyqJC8gtrHU6LKCoyfxP6o/mV7Ta8T4mh?=
 =?us-ascii?Q?do9W91/86Q=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c071fff-6cf3-4290-6d2e-08df056d8c2c
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2026 01:33:37.2371
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uQ8L13HTQFs9tEVWwqg0TyZkjdycZ1f+jI8DnEN2JaYkrnC2OHsg4rVgtvWK1Bv+hJ8+n/H7UF/1hhmKOJ68Tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAVPR12MB999121

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

