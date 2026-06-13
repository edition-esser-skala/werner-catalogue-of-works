\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \minor \time 4/4 \tempoMarkup "Adagio"
    d'2 es4 es
    r e f es
    d cis d4. d8
    d d4 b8 g g r4
    r8 f b4. a8 a4~
    a8 g f2 e4
    fis2 r
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \minor \time 4/4 \tempoMarkup "Adagio"
    r2 r4 g'
    es8 f g4 as a
    g2. fis4
    g g es c
    b r8 f' f4 d
    d2. cis4
    d2 r
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key g \minor \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    d'2^\tutti es4 es
    r e f es
    d cis d4. d8
    d d4 b8 g g r4
    r8 f b4. a8 a4~
    a8[ g] f4 f e
    fis2 r
  }
}

SopranoLyrics = \lyricmode {
  Par -- _ ce,
  par -- _ ce
  mi -- hi Do -- mi --
  ne, ni -- hil e -- nim
  sunt di -- es, di --
  es me -- _
  i.
}

Alto = {
  \relative c' {
    \clef alto
    \key g \minor \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    r2 r4 g'^\tutti
    es8[ f] g4 as a
    g2. fis4
    g g es c
    b r8 f' f4 d
    d2. cis4
    d2 r
  }
}

AltoLyrics = \lyricmode {
  Par --
  _ ce mi -- hi
  Do -- mi --
  ne, ni -- hil e --
  nim sunt di -- es
  me -- _
  i.
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \minor \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    r2 r4 h^\tutti
    c b c4. c8
    b4 g a4. a8
    g4 r r8 c4 a8
    f4 f r8 c' c4~
    c8[ b] h4 a2
    a r
  }
}

TenoreLyrics = \lyricmode {
  Par --
  _ ce mi -- hi,
  mi -- hi Do -- mi --
  ne, ni -- hil
  e -- nim sunt di --
  es me --
  i.
}

Basso = {
  \relative c {
    \clef bass
    \key g \minor \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    r2 r4 g'^\tutti
    as g f fis
    g e d4. d8
    g,4 r r f'!
    d8 d b b f'4 fis8 fis
    g4 gis a2
    d, r8 b'4^\solo f8
  }
}

BassoLyrics = \lyricmode {
  Par --
  _ ce, par -- ce
  mi -- hi Do -- mi --
  ne, ni --
  hil sunt di -- es, e -- nim sunt
  di -- es me --
  i. Quid est
}

Organo = {
  \relative c {
    \clef bass
    \key g \minor \time 4/4 \tempoMarkup "Adagio"
    g'2-\tutti r4 g
    as g f fis
    g e d2
    g,4 r r f'!
    d8 d b b f'4 fis
    g gis a2
    d, b~-\solo
  }
}

BassFigures = \figuremode {
  r2. <_!>4
  <5>8 <6> <8 6! _->4 <_-> <7- 5>
  r <6\\> <4> <_+>
  r2. <_!>4
  <6>2 <5 4>8 <\t 3> <6 5>4
  <9 4>8 <8 3> <7 5>4 <6 4> <5 _+>
  <_+>1
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff <<
        \set GrandStaff.instrumentName = "vl"
        \new Staff {
          \set Staff.instrumentName = "1"
          \ViolinoI
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \ViolinoII
        }
      >>
    >>
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "S"
        \new Voice = "Soprano" { \dynamicUp \Soprano }
      }
      \new Lyrics \lyricsto Soprano \SopranoLyrics

      \new Staff {
        \set Staff.instrumentName = "A"
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyrics

      \new Staff {
        \set Staff.instrumentName = "T"
        \new Voice = "Tenore" { \dynamicUp \Tenore }
      }
      \new Lyrics \lyricsto Tenore \TenoreLyrics

      \new Staff {
        \set Staff.instrumentName = "B"
        \new Voice = "Basso" { \dynamicUp \Basso }
      }
      \new Lyrics \lyricsto Basso \BassoLyrics
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "org" "b" }
        \Organo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
