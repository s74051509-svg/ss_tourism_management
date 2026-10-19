<?php require 'config.php';
$destinations = $pdo->query('SELECT * FROM destinations ORDER BY featured DESC, id DESC')->fetchAll();
$page_title = 'Discover your next journey';
require 'partials/header.php'; ?>
<section class="hero">
 <div class="hero-copy">
  <span class="eyebrow">TRAVEL MORE · WORRY LESS</span>
  <h1>Your next great<br><em>story starts here.</em></h1>
  <p>Handpicked destinations, thoughtful experiences and easy trip requests — all in one place.</p>
  <div class="hero-actions"><a class="btn btn-primary" href="#destinations">Explore destinations <span>↗</span></a><a class="text-link" href="my_bookings.php">Track my trip →</a></div>
  <div class="hero-stats"><div><strong>6+</strong><span>Curated escapes</span></div><div><strong>Easy</strong><span>Booking requests</span></div><div><strong>Secure</strong><span>Account access</span></div></div>
 </div>
 <div class="hero-photo"><img src="https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?auto=format&fit=crop&w=1400&q=90" alt="Beautiful mountain landscape"><div class="photo-tag"><span class="tag-dot"></span> Your journey, beautifully planned</div></div>
</section>
<section class="section" id="destinations">
 <div class="section-head"><div><span class="eyebrow">THE WORLD IS WAITING</span><h2>Popular destinations</h2><p>Find the place that feels like your kind of adventure.</p></div><span class="count-pill"><?=count($destinations)?> experiences</span></div>
 <div class="destination-grid">
 <?php foreach($destinations as $d): ?>
 <article class="destination-card">
  <a class="destination-image" href="destination.php?id=<?=(int)$d['id']?>"><img src="<?=e($d['image_url'])?>" alt="<?=e($d['name'])?>" loading="lazy"><span class="image-arrow">↗</span></a>
  <div class="destination-body"><div class="location">⌖ <?=e($d['location'])?></div><h3><?=e($d['name'])?></h3><p><?=e($d['description'])?></p><div class="card-foot"><div><small>Starting from</small><strong>₹<?=number_format((float)$d['price'])?></strong><small> / person</small></div><a href="destination.php?id=<?=(int)$d['id']?>" class="round-link" aria-label="View destination">→</a></div></div>
 </article>
 <?php endforeach; ?>
 </div>
</section>
<section class="callout"><div><span class="eyebrow">LET'S MAKE IT HAPPEN</span><h2>Your dream trip is closer than you think.</h2><p>Create an account, send a request and follow every update from your dashboard.</p></div><a class="btn btn-light" href="<?=current_user()?'my_bookings.php':'register.php'?>">Plan my trip <span>↗</span></a></section>
<?php require 'partials/footer.php'; ?>
