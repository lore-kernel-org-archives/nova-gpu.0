Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010014.outbound.protection.outlook.com [52.101.193.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BCEA493D5E
	for <nova-gpu@lists.linux.dev>; Fri,  2 Oct 2026 12:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790943161; cv=fail; b=VQGo8zAHpe9b/ulkzwf15PiRye05PwlMfxF8ssg07aBjrvpUIKhtl6F+JZibOrTs/tAapXbc3HclL3/6wsun0PzIjmpOXCta+3UlgNTs+J8IKRfkp7S2qcY2XPjFfyJy6mM+GgGq8WkaCdK3kBQmVM444tIq+MqfABezz7Mnrq0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790943161; c=relaxed/simple;
	bh=yPXYSZKfHwrSu9Hmze30fHSTAlHcnjfkA7VPk/nXJP8=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=Qwsus6wIW5S3CV17SeDDpZTnMedtI68UFy4UQ7mirWCnkxb2eUXaF4ZmuP41aJLITqs8IJ7HBuYO/cT1xpS+3zkut0zFsK4SomdGKKcZZ8HmEPL1xcCL+Tunt3mrPF+NbnJ09+1yYMxJF5rqzofnNWD3vnAwaBJRXoZmOIBC4kE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=o7Hm2LYg; arc=fail smtp.client-ip=52.101.193.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="o7Hm2LYg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZuGJK4sayenwbgvF7FAk74fkOj+yhGyBXiYU7L2wdVXDw1S7NZhO4V4iJx52a92Qp0gq3n7eipPMByJ63bUef1FqK/zra7JoeGZWP1imwFgFbjilvJTMYFF/HczadfpcE2C4nOdqK0r6hT097IN3RpmAQCkD4tiZHxrdWwnFd+HjJvNkoG5GhpPvZPrkx3XAdqI5kDohqizQfJldxPiW4O/QTcVbBTJgJocQn8Twg6R1RuQyOR7MGkeMdsScWpcgCTwaS/RzpvCZvM0KkpuAYlYyQgeYegLw1r3OilMgSC8nIVfgbV9Dn22vYCyk9rgo6uoIyQKcdXG2E5pY7eLP5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yhOhGdOLGYOK24KZfrNDEUtrbaHimnAczAogjzj67XM=;
 b=gOF4gqXeji+SuMP/aKuWZek9KoTWq4+PV+NWUPm05G44Rlcp3x41CmJaDXOH9NJalreB0pE2VVkGUQbNHtGudcytHktU6FHezbczNF7y1i0MgxmsJyezBNT1WlNx7cZKuYmXYSYDCLNrKyUWlIcvAQeXVQl/RIpne6119zo0nE6LOsJS9yCRpsPRh1A1GSRcA7AN00Mpxdi7mlTtld9e4bdFdAVBbRrqgs8F/Pf5BnA14blX1w76Olo5UiXmgF7fwGoMhuTxTPWlHFRt28xbJ5VhFD4WxdbuRQUHvdXDXt6N6fgqVpMgduXRtOQHJnSMJo+BafcJAj82Tap6vRtafA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yhOhGdOLGYOK24KZfrNDEUtrbaHimnAczAogjzj67XM=;
 b=o7Hm2LYgCBkgMVrpJDmTWK7EbFMcCX5QwkYDQBIZCZo3dxC7cmayED+09n0dQTVyrFmPZnn5lAnaRZmdFDfn20vtj72QC4cK/o2z7rdqXP17EpUTK9In3pabO98rVHXZgyjsbQRBezaIH5gCh1Ei8mnUGY33JXk49UY63JK8LqgyMjqnKAWCCGCFNPZgsrRd3fSZI21xL+QVyUXKdc9MqPfOhQkVQ02HvAtT7s9bbILbtx0jYfNv4XXqusmLvuISoL82+SwO1o2pdWVUCaMW7MEjIv8muVsBtQ5b7dRaEuoDzHXbje3hcjjduzpAYSsy3WdG8ryifrD0hfpbOXPBlA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by BL4PR12MB9721.namprd12.prod.outlook.com (2603:10b6:208:4ed::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Fri, 2 Oct
 2026 12:12:35 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0472.016; Fri, 2 Oct 2026
 12:12:35 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 02 Oct 2026 21:12:31 +0900
Message-Id: <DLUCD1R3Y143.3BVXITEPZYCPR@nvidia.com>
Cc: "Gary Guo" <gary@garyguo.net>, "Danilo Krummrich" <dakr@kernel.org>,
 "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Eliot Courtney" <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Bjorn Helgaas" <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <nova-gpu@lists.linux.dev>, "LKML" <linux-kernel@vger.kernel.org>, "Joel
 Fernandes" <joelagnelf@nvidia.com>
Subject: Re: [PATCH v5 02/15] rust: sync: completion: add
 wait_for_completion_timeout()
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
References: <20260930034148.590687-1-jhubbard@nvidia.com>
 <20260930034148.590687-3-jhubbard@nvidia.com>
 <DLU9C3WDP0T6.155CTDSBPI93M@garyguo.net>
 <DLUAPXVM7NYD.2DOV5B2ALJ6XN@nvidia.com>
 <59900705-fadd-46bb-93eb-8f6d8e7be551@nvidia.com>
In-Reply-To: <59900705-fadd-46bb-93eb-8f6d8e7be551@nvidia.com>
X-ClientProxiedBy: TYWPR01CA0048.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::18) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|BL4PR12MB9721:EE_
X-MS-Office365-Filtering-Correlation-Id: 366b01a4-7e0b-45f2-daa3-08df207e7139
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|376014|7416014|23010399003|366016|13003099007|22082099003|18002099003|6133799003|56012099006|4143699003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	MW6O8Py1t9KzOiwsuKLKoeR+/RIyFR9ivwZ5PJ7skHScbFzreDZexb9NUi1Hvyl2SShKnAiSarTLXXKF7m0eXUForuuq7k8eMqiB8IVkDPuiXME3BMxs34wQIk0X1lye5fTeE/W9Aw1SPOUIuuz/+MbVZoctIxtplOA47aCASULyz4FGMG1y1quhHMSv5g2DQDIJEhDT7EfOSuo/HEDDnZXGVvCKwsiOKbhIVa3qKpVm6DO0kCGuKxKfnxtmCz73HiV6DfDDIVqIHzjNw0rbT8ZRaMXt8piz6j/1lCiqpsB7PS1xQiIdLGyyTZ5wi4nO6k+vN2fy3KxetKjUrUcDL0LxUiFscvD3l0do2FG5Y+C2FK0inE4C2fJSP4P2CxQaEID3G3cgNuD/opknbhrI3yVL7cDgllS6bxIZ1tCdEe9AZNdJm3FCyVevYuyzUdkT26hjO5Vc8SyBb56kOzGeeub0QVTFO7UXZTg43CcWSvry/aMYVFfDSbb3nf6Wgl3KXmfvjwuDEBXUKNHZhjgFHZf7i7VrjrRtzubEmcF9IvBKHSut8SyjBl7BmUvxSqoiI8mFi+/HnqzrXEI9IU9IGByJa6FoKmtJu+AlvDz9BEc2Ygwa4vOko9r6sWiJT/dmePPMb3WhE3nAKhE9cCJEtKME92SHqkqm6M0+ajFFEhg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(376014)(7416014)(23010399003)(366016)(13003099007)(22082099003)(18002099003)(6133799003)(56012099006)(4143699003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SkNEd1JaVjJVZGVjblhPVThpRWV1amY0ODc2Umg5RlorZERIeVY0TGxta3JD?=
 =?utf-8?B?ZERvd2NRSHN3TXVyUjJ0Snh0NUVyek9QTjlScTFwbzhNdFVkWW5xWTR5Zm03?=
 =?utf-8?B?cGszSk1PUlZyNEt4SkE4WlRkNVRGcVhlSGNxUHFZR3hGWTBFZXFIU2puM1JN?=
 =?utf-8?B?a2tmWkZITE5aSlErUHRpYWtHTEQ2ekdGUk9ZLzhsL01KZERRUWlSWlVwNEN3?=
 =?utf-8?B?VkRsYWRIdGRndDNtanRmVEpWUXVKekdielFFcStGZ0pic1hyeXhydFhhczlZ?=
 =?utf-8?B?eXV3SzR1Y1VlTFJaNjJ1bVAxeHM1QU9qQ1BON0VoT3BsL1NTTTF0ZUdTbFdx?=
 =?utf-8?B?UWM0WGxTSnd6YUsxRzQvY3BqUHFEaVR3Wm9ScXh6NmJmcEg3ZVFGZUQ2VTNx?=
 =?utf-8?B?ZWNGOHNnT0IzdHFITW9SbGFYVVRpa3ZjZlpWYnJXcG1JdjRBWWh2YVlvQmgx?=
 =?utf-8?B?cGdkV0NScXpGaUx3bWVDSVFvSFZiMm5HSy8rYXluUGdrWTlqVXJhU0JkMHIr?=
 =?utf-8?B?a2ZHOE9CcjJzQllTR3RkdHBpOVNLTkN5UnJHaHNyYnpZLzNpZS9tQnFBa21x?=
 =?utf-8?B?cXcxVTJxZE1USUY0b080cThJbVM3MnhjQkFSa3dadEUvcjFSY1N5cWRINEVw?=
 =?utf-8?B?VGVMbVF0ZGdpZVlyMXJrSmJmZEN3ejdSaVdTRzJYdTV2UHlsWHV4dE4zVHRk?=
 =?utf-8?B?OWx0aHBpemlxNTRYLzNwOWtJR3VpcjdPcnBhYTF4eVNqSndSa3RrSmQ3Yk5T?=
 =?utf-8?B?dW45U3pJYXRhNE9GU0NuRWo3RWczWkhSYkhrMTNSWHhzenZIaW5GRDFibXpR?=
 =?utf-8?B?TlQrbmZYaE5HZWFDSFBpNGdheHZvRlM0aFh1Nmk3RmxzTUt1OVhYdUNMbDNw?=
 =?utf-8?B?NHJuMlVZWGxWSGhseE1pT3dBcGlGVU1CeHEyQXlCajdKblgrdHJpQTUrYUtq?=
 =?utf-8?B?ZTBXYzlOaDFseU13ek9lQ0c3ZFFCWGJzS0kraHdlaFVKcjNXY2lkN2U1Kzdl?=
 =?utf-8?B?N2ZmdnZETEFRVW9yazhTQlZJbUgvOVM1V1puUk9wcEI5ZkJzNGdOTjVEYVIz?=
 =?utf-8?B?Z0R3ZnRTNURVUUI0bTJoYUQ2Ti9EeWthTG5wR0tRdHFmM2FtSVBsVmc0Rkly?=
 =?utf-8?B?Mm5BK3VibmVwQXZOMnhBczVmK0RyL1BUYmFDYUVoVmhzSFlBSG9VNnFwSnMz?=
 =?utf-8?B?YTdSaWhUcElKN2k1VEZTdlZtK1F6cDZITkNpWlNGRXJlVVJEd2lmc045cEN1?=
 =?utf-8?B?ZkN0RE1pd3huZ0xtbHBLNmJYMEJMZXd6WTJXcHNHRDQ4N3BwdUFtRFd0MWtW?=
 =?utf-8?B?UzVzQzZkYTZyd2U0U21yWGV4bkxuWUdpQjBmUzJEcXFzQW1tUVpJa3dBOS9Z?=
 =?utf-8?B?TVB5NW1rbEtUdUd6TVdycXVQNVFlcEV5c3R5dkNDTzkweCtsQXplWS9aeE90?=
 =?utf-8?B?STg3UDRJMUhMWEJaMWpXazdDcUNIb3pISzNHOHB1ZTJRNXNnNGg1TTlBQ1Jo?=
 =?utf-8?B?OHYyYmdMWG1oYzUwUXo3NFBiVEU1N29WQWx0Sk53T0tLNnIrSkRWSUhMdTVh?=
 =?utf-8?B?aERjVTNKaHJseTJFcDlzd2xoVDFNdXVkemRzbVRlNmYxcWVVNXVtRzlQbE1X?=
 =?utf-8?B?c3Jnd2NvcFZJbjhqbWtGdjNIR1ovZUM4cmVBZTgvS2FmbFhmdmlWUDBCRTRE?=
 =?utf-8?B?R3hYS2gzYmhrN3hOdGxyS05CaVRPVE5qSEFoQlFIYnoxRXkwdWJMYjczdVhW?=
 =?utf-8?B?RmNkeEtwdTdIYWhOSDB5Z3lYaml0TkdnSVV6cUQyUmh1dGdDaWNjMm44VVB4?=
 =?utf-8?B?WEVnKzJHZm1FMzllc3Nta3Z6K2xoMDBXa3NLdVVSRzFQVFFvRm1iYzBUQWZs?=
 =?utf-8?B?UmZsZkhBSG45bFdkN3lBK0hoMWdpVE4zMzFkdDlUMkRtODBTZGpscE0wRDd5?=
 =?utf-8?B?aUFYQ0djQkl0R2VaNzNrMlRBOFh1RU1kd1VIYmd4dW8ybUszb1RsMVYxUFBV?=
 =?utf-8?B?SkZOSmFRZmZQZTY3ZlpxNUpKdytkaCs5VjdncWNPcXBFdE5BTGJLaGd1SUhO?=
 =?utf-8?B?bi96c2RScHM0SnNpdmhLY2dGeEtPWURZMmVJdHBVVUo4NWVWeGlST0VWSjBF?=
 =?utf-8?B?dGtrRkxwNS9IWlZaOE83eGF6emVDTk9UdDVMMStmS0pYeUtvbHJnOFFiYStH?=
 =?utf-8?B?VC9pL2lScVlPNmg4dmFkU21DRlM1aGJFdG5HQmdYUVY0MlZXRTkzenBKcDRo?=
 =?utf-8?B?RVZKdW51MkdWckI4RTNmRTB5SnVBKzcrelhMbkl4blZMRW1aYnlFWHQxeTlY?=
 =?utf-8?B?aXNQN2F5NnhLbkdXSi82Y251MnArV1FyMjdzelVXQUpHQ0JxREQwNm9HSHpM?=
 =?utf-8?Q?8Bz1Baknk2JnUOM5Af0WBWqjrhnTPBKGyQY2AxzD35UnU?=
X-MS-Exchange-AntiSpam-MessageData-1: OTE8OybZFTMlEw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 366b01a4-7e0b-45f2-daa3-08df207e7139
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 12:12:35.0094
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ss+V7zg+PFBaw6v+ZNVdi0JUph0Ua6j0zyFRLmt6g+h4kqwm9Yi+TCZYjXrGYGNoRFdnr7Q6V5OUEXUevhnOPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9721

On Fri Oct 2, 2026 at 8:13 PM JST, John Hubbard wrote:
> On 10/2/26 12:55 PM, Alexandre Courbot wrote:
>> On Fri Oct 2, 2026 at 6:50 PM JST, Gary Guo wrote:
>>> On Wed Sep 30, 2026 at 4:41 AM BST, John Hubbard wrote:
>>>> From: Joel Fernandes <joelagnelf@nvidia.com>
>>>>
>>>> A driver that runs an interrupt self-test during probe waits for the
>>>> handler to fire. wait_for_completion() has no timeout, so a broken
>>>> interrupt path stalls probe indefinitely. Add a timeout variant of
>>>> wait_for_completion().
>>>>
>>>> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
>>>> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
>>>> [jhubbard: return the remaining jiffies]
>>>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
>>>
>>> This email should have RfL list CC'ed.
>
> Hi Gary! Apologies, my send-email scripts had drifted into a
> nova-centric direction. Will fix.
>
>
>>>
>>>> ---
>>>>  rust/kernel/sync/completion.rs | 23 ++++++++++++++++++++++-
>>>>  1 file changed, 22 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/rust/kernel/sync/completion.rs b/rust/kernel/sync/complet=
ion.rs
>>>> index 35ff049ff078..7e8b3c1c880e 100644
>>>> --- a/rust/kernel/sync/completion.rs
>>>> +++ b/rust/kernel/sync/completion.rs
>>>> @@ -6,7 +6,12 @@
>>>>  //!
>>>>  //! C header: [`include/linux/completion.h`](srctree/include/linux/co=
mpletion.h)
>>>> =20
>>>> -use crate::{bindings, prelude::*, types::Opaque};
>>>> +use crate::{
>>>> +    bindings,
>>>> +    prelude::*,
>>>> +    time::Jiffies,
>>>> +    types::Opaque, //
>>>> +};
>>>> =20
>>>>  /// Synchronization primitive to signal when a certain task has been =
completed.
>>>>  ///
>>>> @@ -111,4 +116,20 @@ pub fn wait_for_completion(&self) {
>>>>          // SAFETY: `self.as_raw()` is a pointer to a valid `struct co=
mpletion`.
>>>>          unsafe { bindings::wait_for_completion(self.as_raw()) };
>>>>      }
>>>> +
>>>> +    /// Wait for completion of a task, with a timeout.
>>>> +    ///
>>>> +    /// This method waits for the completion of a task, or until `tim=
eout` elapses. It is not
>>>> +    /// interruptible. Returns the number of jiffies left when the ta=
sk completed, or [`None`] if
>>>> +    /// `timeout` elapsed first.
>>>> +    ///
>>>> +    /// See also [`Completion::complete_all`].
>>>> +    #[inline]
>>>> +    pub fn wait_for_completion_timeout(&self, timeout: Jiffies) -> Op=
tion<Jiffies> {
>>>
>>> NACK. Please use the typed `Delta<Jiffy>`, not this old type alias for =
c_ulong.
>>> I asked Miguel to take that late last cycle because I know there'll be =
new users
>>> that want to use Jiffies this cycle!
>>>
>>> This would avoid you having to do clamping on the max side (but you sti=
ll need
>>> to clamp the value to be at least 0). There'll be a helper method for t=
his, but
>>> it isn't available yet.
>>> https://lore.kernel.org/rust-for-linux/20261002050428.2746277-3-tomo@fl=
apping.org/
>>=20
>> I will drop this patch and replace the code using this new method (which
>> is just an optional probe-time self-test) by a polling loop on an
>> atomic. That way we can wait for the helper method to be available and
>> revisit this with the proper type.
>
> OK, whatever works best. Just in case, I did stage a fixed-up version
> of the patch locally (in case I need to send a v6), as per Gary's
> recommended Delta approach. It looks like this:

It's your series so your call, but since the elegant solution will
involve using [1] which is still under review, I would suggest waiting
for it to introduce `wait_for_completion_timeout`, moving forward with
the rest of the series, and revisit using completions once the base code
is ready to limit churn.

Otherwise we are at risk of missing the -rc6 cutoff for this series and
that means an even busier next cycle. The polling code is also simpler
overall than using completions, and for a probe-time selftest polling is
really not a problem. Nova is not losing anything by not using
completions for this.

[1] https://lore.kernel.org/rust-for-linux/20261002050428.2746277-3-tomo@fl=
apping.org/
