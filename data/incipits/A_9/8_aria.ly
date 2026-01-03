\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key es \lydian \time 3/4 \tempoMarkup "Adagio"
      \once \override Staff.TimeSignature.style = #'single-digit
    \after 4*0 -\conSord R2.
    r8 r16 g'' es4-! b-!
    g r r
    r8 r16 g b4-! es-!
    g2 es4
    f2 d4
    es g2
    c, r4
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key es \lydian \time 3/4 \tempoMarkup "Adagio"
      \once \override Staff.TimeSignature.style = #'single-digit
    \after 4*0 -\conSord R2.
    r8 r16 es' b4-! g-!
    es r r
    r8 r16 es g4-! b-!
    es b c~
    c b2~
    b4 g2~
    g8( f) f4 r
  }
}

ViolaI = {
  \relative c' {
    \clef alto
    \key es \lydian \time 3/4 \tempoMarkup "Adagio"
      \once \override Staff.TimeSignature.style = #'single-digit
    g'4\p b8( g) f( d)
    es4 r r
    g~ \tuplet 3/2 4 { g8 f es f es d }
    es4 r r
    R2.*3 
    r8 r16 a f4-! c-!
  }
}

ViolaII = {
  \relative c' {
    \clef alto
    \key es \lydian \time 3/4 \tempoMarkup "Adagio"
      \once \override Staff.TimeSignature.style = #'single-digit
    es4\p g8( es) d( f)
    g4 r r
    b,~ \tuplet 3/2 4 { b8 as g \hA as g f }
    g4 r r
    R2.*3
    r8 r16 f' c4-! a-!
  }
}

Soli = {
  \relative c' {
    \clef tenor
    \key es \lydian \time 3/4 \autoBeamOff \tempoMarkup "Adagio"
      \once \override Staff.TimeSignature.style = #'single-digit
    b4 es f8[ d]
    es4 r r
    es \tuplet 3/2 4 { b8[ as g] \hA as[ g f] }
    g4 r r
    b es \tuplet 3/2 4 { es8[ f g] }
    f[ a,!] b2
    g'8[ es] c4 b
    b8[\trill a] a4 r
  }
}

SoliLyrics = \lyricmode {
  Ô mei -- ne
  Füeß!
  wie hö -- nig --
  ſüeß
  würd euch die
  Müeh be --
  loh -- net, be --
  loh -- net,
}

Continuo = {
  \relative c {
    \clef bass
    \key es \lydian \time 3/4 \tempoMarkup "Adagio"
      \once \override Staff.TimeSignature.style = #'single-digit
    es2 b4
    es,2 r4
    es'2 b4
    es,2 r4
    es'2 c4
    d2 g4
    es e2
    f2 r4
  }
}

BassFigures = \figuremode {
  r2.
  r
  r2 <7->4
  r2.
  r
  <7>4 <6>2
  r4 <6> <5>
  <9 4> <8 3>2
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff \with { \smallGroupDistance } <<
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
      \new GrandStaff <<
        \set GrandStaff.instrumentName = "vla"
        \new Staff {
          \set Staff.instrumentName = "1"
          \ViolaI
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \ViolaII
        }
      >>
    >>
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "St: Petrus"
        \new Voice = "Soli" { \dynamicUp \Soli }
      }
      \new Lyrics \lyricsto Soli \SoliLyrics
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = "bc"
        \Continuo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
  \layout { }
}
